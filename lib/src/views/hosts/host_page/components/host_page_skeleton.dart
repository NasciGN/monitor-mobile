import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/core/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class HostPageSkeleton extends StatelessWidget {
  const HostPageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: _buildPadding(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: const Color.fromARGB(26, 214, 214, 214),
                highlightColor: Theme.of(context).colorScheme.primary,
                child: Container(
                  height: 220,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: _buildContainerDecoration(context),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 100,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10)),
                            )
                          ],
                        )
                      ]),
                ),
              ),
              Shimmer.fromColors(
                baseColor: const Color.fromARGB(26, 214, 214, 214),
                highlightColor: Theme.of(context).colorScheme.primary,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(defaultpd * 2),
                  decoration: _buildContainerDecoration(context),
                  child: Row(children: [
                    Container(
                      height: 50,
                      width: 140,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const Spacer(),
                    Container(
                      height: 30,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ]),
                ),
              ),
              Shimmer.fromColors(
                baseColor: const Color.fromARGB(26, 214, 214, 214),
                highlightColor: Theme.of(context).colorScheme.primary,
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: defaultpd * 2,
                    ),
                    decoration: _buildContainerDecoration(context),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: _buildPadding(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 60,
                                width: 150,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Container(
                                height: 60,
                                width: 150,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultpd * 2),
                          child: Column(children: [
                            Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                    bottom: defaultpd * 2),
                                height: 70,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10))),
                            Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                    bottom: defaultpd * 2),
                                height: 70,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10))),
                            Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                    bottom: defaultpd * 2),
                                height: 70,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10))),
                            Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                    bottom: defaultpd * 2),
                                height: 70,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10))),
                            Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                    bottom: defaultpd * 2),
                                height: 70,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10))),
                          ]),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  EdgeInsets _buildPadding() => const EdgeInsets.all(16);

  BoxDecoration _buildContainerDecoration(BuildContext context) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10), border: Border.all());
  }
}
