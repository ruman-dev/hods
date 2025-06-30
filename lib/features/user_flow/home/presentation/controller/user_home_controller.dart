import '../../../../../core/exports/exports.dart';

class UserHomeController extends GetxController {
  var currentPage = 0.obs;
  var bottomCurrentPage = 0.obs;

  final List<String> images = [
    'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/75384ba17a0e7f52c4ad736fc00b372610da4acc',
    'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/75384ba17a0e7f52c4ad736fc00b372610da4acc',
    'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/75384ba17a0e7f52c4ad736fc00b372610da4acc',
    'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/75384ba17a0e7f52c4ad736fc00b372610da4acc',
  ];

  final List<Map<String, String>> categoryImages = [
    {
      'image':
          'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/63b8a21dd3be5b743a5063d1ef37e4a20c0c7a77',
      'title': 'Handyman',
    },
    {
      'image':
          'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/03e76c3e170fc715ec8a5572c6d23cefd31b9e55',
      'title': 'Spa & wellness',
    },
    {
      'image':
          'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/404074c2ec93109518aed33d54e6deed25f08f19',
      'title': 'Mobile Health',
    },
    {
      'image':
          'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/75384ba17a0e7f52c4ad736fc00b372610da4acc',
      'title': 'Hair & beauty',
    },
    {
      'image':
          'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/b10b5991b843ec63e1a4d31c30a76120f9e3426b',
      'title': 'Home repairs',
    },
    {
      'image':
          'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/605ad1e33708b3aa5599cedd48fd3c5095ac29f6',
      'title': 'Home cleaning',
    },
    {
      'image':
          'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/605ad1e33708b3aa5599cedd48fd3c5095ac29f6',
      'title': 'Home cleaning',
    },
    {
      'image':
          'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/605ad1e33708b3aa5599cedd48fd3c5095ac29f6',
      'title': 'Home cleaning',
    },
    {
      'image':
          'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/605ad1e33708b3aa5599cedd48fd3c5095ac29f6',
      'title': 'Home cleaning',
    },
  ];
}
