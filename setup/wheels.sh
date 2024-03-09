#!/bin/bash

URLS=(
  'https://files.pythonhosted.org/packages/b6/b0/510026c272e0fa3bb3bc2edae7828e4f1764f2686084933003e9b867ac14/aim-3.18.1-cp311-cp311-manylinux_2_24_x86_64.whl'
  'https://files.pythonhosted.org/packages/09/a2/919f70c93fdfcba08730081b0a96a4317f7b7c5d65bdb998de59590d6f05/aim-3.18.1-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl'
  'https://files.pythonhosted.org/packages/98/6c/4aa154a91028600cc7445b76a1d2e3bf89573568fa995dfbf2cf6d4dc877/aim-3.18.1-cp310-cp310-manylinux_2_24_x86_64.whl'
  'https://files.pythonhosted.org/packages/4e/04/e805f2bf40255f17e71128d4d6ab1d3a5c5f76003540cafd6776436d6d6c/aim-3.18.1-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl'
  'https://files.pythonhosted.org/packages/5f/5c/9240b996834baf4faceeab5d9084c98f47064e6d00b81cb50bf2a8bf16a5/aim-3.18.1-cp39-cp39-manylinux_2_24_x86_64.whl'
  'https://files.pythonhosted.org/packages/87/82/15625737fc0a01f69cd037f7d2f6e8eaae9ec99744f8897add47b780327b/aim-3.18.1-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl'
  'https://files.pythonhosted.org/packages/b7/b2/ecbd98341b0cde889ecd83879eb2f9e2ddd4a4d323ad2abfa2e70cd8f625/aim-3.18.1-cp38-cp38-manylinux_2_24_x86_64.whl'
  'https://files.pythonhosted.org/packages/9f/03/a0e4e0b55986633de630a0428ea3af859943aeca50b1e41ff55de21a3c14/aim-3.18.1-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl'
  'https://files.pythonhosted.org/packages/86/25/c4d2169aa1f31e5c4104439e9988640d595913713ed83188158c89c57a0b/aim-3.18.1-cp37-cp37m-manylinux_2_24_x86_64.whl'
  'https://files.pythonhosted.org/packages/75/a5/aad46cb33e65d5148a002403a8c66da787ccead7e5ae30ceb31a133d0e83/aim-3.18.1-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl'

  'https://files.pythonhosted.org/packages/53/13/207ebb5b2315640a68378c31cb31cfe1182373d11a813bd52219c83700a7/aimrecords-0.0.7-py2.py3-none-any.whl'

  'https://files.pythonhosted.org/packages/41/bc/3ed22295d3518785c37ed8dfb1030f264ffef414b46f93c836a09adc91f9/aimrocks-0.5.1-cp311-cp311-manylinux_2_24_x86_64.whl'
  'https://files.pythonhosted.org/packages/9e/f9/c59fc2083223339b56ce873fad83cfa759fe0323f90ef746e2cc7e5f9ceb/aimrocks-0.5.1-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl'
  'https://files.pythonhosted.org/packages/3f/60/c84c4f037f73fb479f94b412b091c9f04549302d73a09573a781c8689f97/aimrocks-0.5.1-cp310-cp310-manylinux_2_24_x86_64.whl'
  'https://files.pythonhosted.org/packages/6f/b4/6326719d1ee1522c928945140e365cef8ff81cf401c3980e108951952fa4/aimrocks-0.5.1-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl'
  'https://files.pythonhosted.org/packages/62/99/e268c75b9ed48299d0d1c8fecc9350adefbbb010270a52e3d514ce9a6f9d/aimrocks-0.5.1-cp310-cp310-manylinux_2_12_x86_64.manylinux2010_x86_64.whl'
  'https://files.pythonhosted.org/packages/f0/25/65059b86caa427ce2127c9514d294dfec312f87dd04577374584f35a961b/aimrocks-0.5.1-cp39-cp39-manylinux_2_24_x86_64.whl'
  'https://files.pythonhosted.org/packages/9f/7d/9fac17b2f7fb4a8a1078d69d218fa0c50595ea8a8467f586eb373dc79a5a/aimrocks-0.5.1-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl'
  'https://files.pythonhosted.org/packages/14/4e/a6467eb8a261c567c6580a639e59434a6fd275f9aeed342b7059a4564c80/aimrocks-0.5.1-cp39-cp39-manylinux_2_12_x86_64.manylinux2010_x86_64.whl'
  'https://files.pythonhosted.org/packages/64/76/a0fa343460f72ffba25ba6b27dfbd41a5db35adc9628a1222fdef47676fe/aimrocks-0.5.1-cp39-cp39-manylinux_2_5_x86_64.manylinux1_x86_64.whl'
  'https://files.pythonhosted.org/packages/ea/cd/6988c3c7fe7b48c1c1367065d16e4ecd378496522e0f7b774fb20d3ef2a6/aimrocks-0.5.1-cp38-cp38-manylinux_2_24_x86_64.whl'
  'https://files.pythonhosted.org/packages/6f/88/9db2fb1a1e8ff37731aedf1b24d9e59eb94a975ab8efb8473d097f81beed/aimrocks-0.5.1-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl'
  'https://files.pythonhosted.org/packages/9a/64/58b7fc77f88a77a5993d4014cd37d605878b647385af62bf464f7e1b9c30/aimrocks-0.5.1-cp38-cp38-manylinux_2_12_x86_64.manylinux2010_x86_64.whl'
  'https://files.pythonhosted.org/packages/0d/a5/e520885aeef44c1c86a255acda182f0efe3283997dd12869f108d1ab2fde/aimrocks-0.5.1-cp38-cp38-manylinux_2_5_x86_64.manylinux1_x86_64.whl'
  'https://files.pythonhosted.org/packages/27/ed/a20ceeb9ef88f951884355fac71010093712485a008543ab9aebe9ae37bc/aimrocks-0.5.1-cp37-cp37m-manylinux_2_24_x86_64.whl'
  'https://files.pythonhosted.org/packages/0e/e0/915032e4e808d07fde0398ee15f10233a1232f035056c8b32679ba13ca3d/aimrocks-0.5.1-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl'
  'https://files.pythonhosted.org/packages/d5/be/c83350d4534dddd98004823ccdfe6eda9d6bd3117749fbaccd2c36614d5b/aimrocks-0.5.1-cp37-cp37m-manylinux_2_12_x86_64.manylinux2010_x86_64.whl'
  'https://files.pythonhosted.org/packages/06/6f/c48af99e5b327bb07c7c90c8c7344ad8356a2b2abe461bcb06e91a46a8b2/aimrocks-0.5.1-cp36-cp36m-manylinux_2_24_x86_64.whl'
  'https://files.pythonhosted.org/packages/38/44/beb4c76de1f32844c84760658e9b71a0ec91670414e7179aa25f6138237c/aimrocks-0.5.1-cp36-cp36m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl'
  'https://files.pythonhosted.org/packages/a8/46/c49f8efb76ac41a5018ea4e0cad20dda691f6b4b8aabaf1e315f0490dcea/aimrocks-0.5.1-cp36-cp36m-manylinux_2_12_x86_64.manylinux2010_x86_64.whl'
  'https://files.pythonhosted.org/packages/ec/8c/92607607add4ac10a815b263bf9fc4f250569a2074fdf477cbaafdf8c0ba/aimrocks-0.5.1-cp36-cp36m-manylinux_2_5_x86_64.manylinux1_x86_64.whl'
)

mkdir -p ~/wheelhouse
cd ~/wheelhouse || exit 1

for url in "${URLS[@]}"; do
  wget --no-clobber "$url"
done

