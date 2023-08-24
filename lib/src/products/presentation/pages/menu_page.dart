import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_menu/microapp/microapp_menu.dart';
import 'package:events_time_microapp_menu/src/products/domain/models/category_model.dart';
import 'package:events_time_microapp_menu/src/products/presentation/controllers/menu_states.dart';
import 'package:events_time_microapp_menu/src/products/presentation/controllers/menu_store.dart';
import 'package:events_time_microapp_menu/src/products/presentation/pages/widgets/example_category_section.dart';
import 'package:events_time_microapp_menu/src/products/presentation/pages/widgets/example_data.dart';
import 'package:events_time_microapp_menu/src/products/presentation/pages/widgets/increment_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

class MenuPage extends StatefulWidget {
  static const String routeName = '/menu-page';
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  final List<Category> data = ExampleData.data;

  late TabController tabController;

  int count = 0;

  double priceProduct = 200.00;
  double calculate = 0;
  late AutoScrollController autoScrollController;

  final MenuStore menuStore = MicroappMenu.injector.get();
  late Function() menuStoreListener;

  final TextEditingController controllerMenu = TextEditingController();

  @override
  void initState() {
    menuStore.getMenuByEvent(1);
    menuStoreListener = _menuStoreListener;
    menuStore.addListener(menuStoreListener);

    autoScrollController = AutoScrollController();
    super.initState();
  }

  @override
  void dispose() {
    menuStore.removeListener(menuStoreListener);
    controllerMenu.dispose();
    super.dispose();

    tabController.dispose();
    autoScrollController.dispose();
  }

  Function() get _menuStoreListener => () {
        if (menuStore.value is LoadedMenuStates) {
          tabController = TabController(
              length: menuStore.menuModel!.categories.length, vsync: this);
        }
        if (menuStore.value is ErrorMenuStates) {
          DSDialog(
            type: DSDialogType.ERROR,
            parentContext: context,
            title: 'Falha na busca de eventos e estandes relacionados',
            message: (menuStore.value as ErrorMenuStates).message,
            buttonOnPressed: () => Navigator.of(context).pop(),
            buttonText: 'Ok, entendi',
          ).show();
          return;
        }

        if (menuStore.value is ConfirmedMenuState) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            MenuPage.routeName,
            (_) => false,
          );
          return;
        }
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DSNavBar(
        leading: DSIconButton(
          icon: Icons.arrow_back_ios,
          onPressed: () => MicroappMenu.mainNavigatorKey.currentState!.pop(),
        ),
      ),
      body: ValueListenableBuilder<MenuStates>(
        valueListenable: menuStore,
        builder: (BuildContext context, MenuStates value, _) {
          final bool menuLoaded = value is LoadedMenuStates;
          return menuLoaded
              ? VerticalScrollableTabView(
                  autoScrollController: autoScrollController,
                  tabController: tabController,
                  listItemData: menuStore.menuModel!.categories,
                  eachItemChild: (dynamic object, _) =>
                      ExampleCategorySection(category: object as CategoryModel),
                  slivers: <SliverAppBar>[
                    SliverAppBar(
                      toolbarHeight: 0,
                      leadingWidth: kLayoutSpacerS,
                      backgroundColor: DSColors.neutral.s100,
                      pinned: true,
                      bottom: TabBar(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kLayoutSpacerXS),
                        isScrollable: true,
                        controller: tabController,
                        indicatorColor: DSColors.primary.base,
                        labelColor: DSColors.primary.base,
                        unselectedLabelColor: DSColors.neutral.s46,
                        indicatorWeight: 3.0,
                        tabs: menuStore.menuModel!.categories
                            .map((CategoryModel e) {
                          return Tab(text: e.name);
                        }).toList(),
                        onTap: (int index) {
                          VerticalScrollableTabBarStatus.setIndex(index);
                        },
                      ),
                    ),
                  ],
                )
              : CircularProgressIndicator();
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: DSColors.neutral.s100,
          boxShadow: <BoxShadow>[
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DSButtonBar.withText(
                value: r'R$ 0,00',
                caption: 'Valor da compra',
                primaryButtonText: 'Ver Sacola',
                primaryOnPressed: () {
                  DSBottomSheet(
                    size: DSBottomSheetSize.LARGE,
                    title: 'Sacola',
                    screenContext: context,
                    child: Column(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Expanded(
                            child: SizedBox(
                              height: 500,
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      const SizedBox(height: kLayoutSpacerXS),
                                      DSDivider(
                                        theme: DSDividerTheme(
                                            color: DSColors.neutral.s72),
                                      ),
                                      const SizedBox(height: kLayoutSpacerXS),
                                    ],
                                  );
                                },
                                shrinkWrap: true,
                                itemCount: 12,
                                itemBuilder: (context, i) {
                                  return Column(
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Image.asset(
                                            '', // image here
                                            fit: BoxFit.cover,
                                            height: 100,
                                            width: 130,
                                          ),
                                          const SizedBox(
                                              width: kLayoutSpacerXS),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                DSText(
                                                  'Título do Outback',
                                                  type: DSTextType.NUMBER,
                                                ),
                                                const SizedBox(
                                                    height: kLayoutSpacerXXXS),
                                                DSText(
                                                  'Barraca 1',
                                                  type: DSTextType.NUMBER_SMALL,
                                                  color: DSColors.primary.base,
                                                ),
                                                const SizedBox(
                                                    height: kLayoutSpacerXXXS),
                                                DSText(
                                                  'Subtítulo do Outback asas as as as as as s aaaaaaaaaaaa as as as as a saassas as ',
                                                  type: DSTextType.LABEL_SMALL,
                                                ),
                                                const SizedBox(
                                                    height: kLayoutSpacerXXXS),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: kLayoutSpacerXXS),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          DSText(
                                            r'R$ 25,00',
                                            type: DSTextType.NUMBER,
                                          ),
                                          IncrementItemWidget(count: count),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: kLayoutSpacerS),
                        DSButton(
                          text: 'Próximo',
                          size: DSButtonSize.SMALL,
                          buttonStyle: DSButtonStyle.PRIMARY,
                          onPressed: () {
                            // Navigator.of(context).pushNamed(
                            //   ShoppingCartPage.routeName,
                            // );
                          },
                        ),
                      ],
                    ),
                  ).show();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
