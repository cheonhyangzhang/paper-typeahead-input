# Contributing to paper-typeahead-input

Want to contribute to paper-typeahead-input... that's awesome! I really appreciate the help in making this project better. Here you will find everything you need to know in order to solve problems, report bugs, request features and implement your contribution and send it as a pull request.

## Reporting a bug

If you find a bug in the code or an error in the documentation and want to report it, check whether it's already been reported by searching the issue tracker. In case it hasn't yet, create a new issue and describe the problem you've found. Please be sure to include the following information along with your message:

- Version of paper-typeahead-input you are using.
- Version of Polymer you are using.

## Setting up your environment

Here's what you need to do before start working on the code:

1. Fork the repository
2. Clone your repository

        git clone https://github.com/<your_github_username>/paper-typeahead-input

5. Go to the paper-typeahead-input directory

        cd paper-typeahead-input

6. Add the main paper-typeahead-input repo as an upstream remote

        git remote add upstream https://github.com/cheonhyangzhang/paper-typeahead-input

7. Install all the bower packages

        bower install

8. Run local server

        polyserve -p <port_number>

## Pull Request guidelines

Before submitting your pull request, consider the following:

- Make your changes in a new branch (this will help you rebase your code if/when needed). Make sure you checkout this branch based on latest master branch.

        git checkout -b my-feature-branch

    **Important**:
    Each feature/bugfix should reside in its own branch, and each branch should be based on the master branch. Avoid implementing a new feature/bugfix on top of another one because that makes code reviews harder and prevents pull requests from being selectively merged.

You may need to rebase your branch on top of the latest version of the master branch. To do so is simple:

1. Switch to `master` branch

        git checkout master

2. Pull the latest changes from the server

        git pull upstream master

    **Note:** That command should **always** result in a fast-forward merge.

3. Switch back to your feature branch

        git checkout my-feature-branch

4. Rebase it on top of the master branch (there might be conflicts you'll need to resolve)

        git rebase master -i

5. Push the changes into your remote repository

        git push

6. In GitHub, send a pull request to `paper-typeahead-input:master`

That's it! Thank you for contributing!

In case you need to do changes after creating a pull request, repeat steps 1 though 4 and force a push into your remote repository

    git push --force

That will update your pull request. You might want to update the PR page explaining the changes you have done.
