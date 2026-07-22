# SPDX-License-Identifier: ISC

project(
    'libudev-zero',
    'c',
    version: '1.0.4',
    license: 'ISC',
    meson_version: '>=0.60.0',
    default_options: [
        'c_std=c99',
        'warning_level=2',
        'default_library=both',
    ],
)

cc = meson.get_compiler('c')

usb_ids_path = get_option('usb-ids-path')
if usb_ids_path == ''
    usb_ids_path = get_option('prefix') / get_option('datadir') / 'hwdata' / 'usb.ids'
endif

add_project_arguments(
    '-D_XOPEN_SOURCE=700',
    '-DUSB_IDS_PATH="@0@"'.format(usb_ids_path),
    cc.get_supported_arguments(
        '-Wpedantic',
        '-Wmissing-prototypes',
        '-Wstrict-prototypes',
        '-Wno-unused-parameter',
    ),
    language: 'c',
)

libudev = library(
    'udev',
    files(
        'udev.c',
        'udev_device.c',
        'udev_enumerate.c',
        'udev_list.c',
        'udev_monitor.c',
    ),
    soversion: '1',
    install: true,
)

install_headers(
    configure_file(
        input: 'udev.h',
        output: 'libudev.h',
        copy: true,
    ),
)

pkg = import('pkgconfig')
pkg.generate(
    libudev,
    name: 'libudev',
    filebase: 'libudev',
    description: 'Daemonless replacement for libudev',
    url: 'https://github.com/illiliti/libudev-zero',
    version: '251',
)
