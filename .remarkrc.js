exports.settings = { bullet: '*', paddedTable: false };

exports.plugins = [
    'remark-frontmatter',
    'remark-gfm',
    'remark-preset-lint-recommended',
    'remark-preset-lint-consistent',
    ['remark-lint-list-item-indent', false],
    ['remark-lint-no-dead-urls', false],
    ['remark-lint-maximum-line-length', 120],
    ['remark-lint-maximum-heading-length', 120],
    ['remark-lint-strong-marker', '*'],
    ['remark-lint-emphasis-marker', '_'],
    ['remark-lint-unordered-list-marker-style', '*'],
    ['remark-lint-list-item-spacing', false],
];
