import 'package:flutter/material.dart';

class ProductPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;
  final bool isLoading;

  const ProductPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (totalPages <= 1) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Previous page button
          _PaginationButton(
            icon: Icons.chevron_left,
            onPressed:
                currentPage > 1 && !isLoading
                    ? () => onPageChanged(currentPage - 1)
                    : null,
          ),
          const SizedBox(width: 8),

          // Page numbers
          if (totalPages <= 5) ...[
            // Show all pages if less than 5
            for (int i = 1; i <= totalPages; i++)
              _PageNumberButton(
                page: i,
                isActive: i == currentPage,
                onPressed: !isLoading ? () => onPageChanged(i) : null,
              ),
          ] else ...[
            // Show first page
            _PageNumberButton(
              page: 1,
              isActive: 1 == currentPage,
              onPressed: !isLoading ? () => onPageChanged(1) : null,
            ),
            const SizedBox(width: 4),

            // Show dots or middle pages
            if (currentPage <= 3) ...[
              for (int i = 2; i <= 4; i++)
                _PageNumberButton(
                  page: i,
                  isActive: i == currentPage,
                  onPressed: !isLoading ? () => onPageChanged(i) : null,
                ),
              const Text('...', style: TextStyle(fontSize: 16)),
            ] else if (currentPage >= totalPages - 2) ...[
              const Text('...', style: TextStyle(fontSize: 16)),
              for (int i = totalPages - 3; i <= totalPages - 1; i++)
                _PageNumberButton(
                  page: i,
                  isActive: i == currentPage,
                  onPressed: !isLoading ? () => onPageChanged(i) : null,
                ),
            ] else ...[
              const Text('...', style: TextStyle(fontSize: 16)),
              _PageNumberButton(
                page: currentPage - 1,
                onPressed:
                    !isLoading ? () => onPageChanged(currentPage - 1) : null,
              ),
              _PageNumberButton(page: currentPage, isActive: true),
              _PageNumberButton(
                page: currentPage + 1,
                onPressed:
                    !isLoading ? () => onPageChanged(currentPage + 1) : null,
              ),
              const Text('...', style: TextStyle(fontSize: 16)),
            ],

            // Show last page
            const SizedBox(width: 4),
            _PageNumberButton(
              page: totalPages,
              isActive: totalPages == currentPage,
              onPressed: !isLoading ? () => onPageChanged(totalPages) : null,
            ),
          ],
          const SizedBox(width: 8),

          // Next page button
          _PaginationButton(
            icon: Icons.chevron_right,
            onPressed:
                currentPage < totalPages && !isLoading
                    ? () => onPageChanged(currentPage + 1)
                    : null,
          ),
        ],
      ),
    );
  }
}

class _PaginationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _PaginationButton({required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: 24),
      onPressed: onPressed,
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color:
                onPressed != null
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}

class _PageNumberButton extends StatelessWidget {
  final int page;
  final bool isActive;
  final VoidCallback? onPressed;

  const _PageNumberButton({
    required this.page,
    this.isActive = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor:
              isActive
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
          foregroundColor:
              isActive
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color:
                  isActive
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey.shade300,
            ),
          ),
        ),
        child: Text(
          '$page',
          style: TextStyle(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
