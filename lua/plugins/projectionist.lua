vim.g.projectionist_heuristics = {
  ['*.go'] = {
    ['*.go'] = {
      alternate = '{}_test.go',
      type = 'source'
    },
    ['*_test.go'] = {
      alternate = '{}.go',
      type = 'test'
    },
  },
  ['pyproject.toml'] = {
    ['*.py'] = { alternate = 'tests/test_{}.py' }
  },
  ['vue.config.js'] = {
    ['src/*.vue'] = { alternate = 'tests/unit/{}.spec.js' },
    ['src/*.js'] =  { alternate = 'tests/unit/{}.spec.js' },
    ["tests/unit/*.spec.js"] = { dispatch = 'yarn test:unit {file}' }
  }
}
