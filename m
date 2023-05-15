Return-Path: <SRS0=xk+R=BE=gmail.com=bryanhundven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6123DC77B75
	for <linux-firmware@archiver.kernel.org>; Mon, 15 May 2023 21:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21B77C4339B; Mon, 15 May 2023 21:09:43 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3158C433D2
	for <linux-firmware@kernel.org>; Mon, 15 May 2023 21:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3158C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-643aad3bc41so12727983b3a.0
        for <linux-firmware@kernel.org>; Mon, 15 May 2023 14:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684184980; x=1686776980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LBPSch1RD624w+4nzDFoaQuKTrQZIUbHcqdNhW2/1Gk=;
        b=QIW8En6PIZzEQ+GBbdI95+m98lJwqIiv19N34C4yoQKUVQSXXYFuo9zg49t1PcPall
         XPS4zPhU8rpOrjpVATlJl9q7Zikn6kctHW3Mn4o36sz5nyAc8GrJMxFbDVrFxGbnCHEZ
         a+ZrYe9ACoaMMTKKTJCU4CCTAs6p4fq6Pxoz/TtOYrY7pE7dOWcYwsgYefo+KNZuRnta
         YxsuKhkMU5PtSQcjOGwHoL6llTDjiTlu5Pu/5bLfbO3n1wispc+YZGWytLE5jlQffRWC
         UyG2lIG7Pyls6hst2uY9h3ucwnWOwbbioHcLXF89T/wZ1nFEb7zQI5ZL/QtjO3beCLPu
         Kh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684184980; x=1686776980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBPSch1RD624w+4nzDFoaQuKTrQZIUbHcqdNhW2/1Gk=;
        b=NYjTD69BekiguhM/HqLFt3h2u49aiR28ee0PtOjE/M0NqMo1JBA7i9hze2zgD9hIIF
         c+Kb60norOHzgYsGeu1ZzqWWa+NGhV9x1UtLwTY2sH8XCqCNEEp/LHJ4yi0vYSQ1s1Gp
         Job2ZeqfgmPKwyX/HhNv6Ap0rWAZxidalE8gC892S6kDy6RNeV7qGToKerg+cnqecbs/
         BC80TYilq02Bikk4x+IVdhj1yUMd9NEGvj5uW2jBdwhrr48GWFjITd8jmnE/HcT4qu9Q
         P02m6W/m/X3i8K0X4AMrLFgyO4s4WT0EyzWOKXkVnKqaLlsH0vpe3vFcF5vWjrLU32sk
         UAEA==
X-Gm-Message-State: AC+VfDzo7UCp5jC5KmS+m1CAe8Pie2t2L9fNDHX5KPV5i/wUbW9frTqF
	xOGqJPbclJjukSwtakKyat0F+JVD8NQ=
X-Google-Smtp-Source: ACHHUZ7zZKuoekDvEcdDaD+lc+n6oZthDdK0I6VY7NFXRFvef90q1In/baiOSQpaT+Sm2mJ/gMMozw==
X-Received: by 2002:a05:6a20:429b:b0:101:4c8c:d1fa with SMTP id o27-20020a056a20429b00b001014c8cd1famr33156502pzj.5.1684184979422;
        Mon, 15 May 2023 14:09:39 -0700 (PDT)
Received: from localhost.localdomain (97-113-56-195.tukw.qwest.net. [97.113.56.195])
        by smtp.gmail.com with ESMTPSA id i10-20020aa78b4a000000b00640dbf177b8sm12263543pfd.37.2023.05.15.14.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 14:09:38 -0700 (PDT)
From: Bryan Hundven <bryanhundven@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Bryan Hundven <bryanhundven@gmail.com>
Subject: [PATCH] Clean up check_whence.py style
Date: Mon, 15 May 2023 14:09:16 -0700
Message-Id: <20230515210916.33211-1-bryanhundven@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use flake8, pylint, and black to clean up python code style for
check_whence.py and potentially any future python scripts.

Signed-off-by: Bryan Hundven <bryanhundven@gmail.com>
---
 .flake8         |   2 +
 .pylintrc       | 630 ++++++++++++++++++++++++++++++++++++++++++++++++
 check_whence.py |  86 ++++---
 3 files changed, 691 insertions(+), 27 deletions(-)
 create mode 100644 .flake8
 create mode 100644 .pylintrc

diff --git a/.flake8 b/.flake8
new file mode 100644
index 0000000..7da1f96
--- /dev/null
+++ b/.flake8
@@ -0,0 +1,2 @@
+[flake8]
+max-line-length = 100
diff --git a/.pylintrc b/.pylintrc
new file mode 100644
index 0000000..202ec02
--- /dev/null
+++ b/.pylintrc
@@ -0,0 +1,630 @@
+[MAIN]
+
+# Analyse import fallback blocks. This can be used to support both Python 2 and
+# 3 compatible code, which means that the block might have code that exists
+# only in one or another interpreter, leading to false positives when analysed.
+analyse-fallback-blocks=no
+
+# Clear in-memory caches upon conclusion of linting. Useful if running pylint
+# in a server-like mode.
+clear-cache-post-run=no
+
+# Load and enable all available extensions. Use --list-extensions to see a list
+# all available extensions.
+#enable-all-extensions=
+
+# In error mode, messages with a category besides ERROR or FATAL are
+# suppressed, and no reports are done by default. Error mode is compatible with
+# disabling specific errors.
+#errors-only=
+
+# Always return a 0 (non-error) status code, even if lint errors are found.
+# This is primarily useful in continuous integration scripts.
+#exit-zero=
+
+# A comma-separated list of package or module names from where C extensions may
+# be loaded. Extensions are loading into the active Python interpreter and may
+# run arbitrary code.
+extension-pkg-allow-list=
+
+# A comma-separated list of package or module names from where C extensions may
+# be loaded. Extensions are loading into the active Python interpreter and may
+# run arbitrary code. (This is an alternative name to extension-pkg-allow-list
+# for backward compatibility.)
+extension-pkg-whitelist=
+
+# Return non-zero exit code if any of these messages/categories are detected,
+# even if score is above --fail-under value. Syntax same as enable. Messages
+# specified are enabled, while categories only check already-enabled messages.
+fail-on=
+
+# Specify a score threshold under which the program will exit with error.
+fail-under=10
+
+# Interpret the stdin as a python script, whose filename needs to be passed as
+# the module_or_package argument.
+#from-stdin=
+
+# Files or directories to be skipped. They should be base names, not paths.
+ignore=CVS
+
+# Add files or directories matching the regular expressions patterns to the
+# ignore-list. The regex matches against paths and can be in Posix or Windows
+# format. Because '\\' represents the directory delimiter on Windows systems,
+# it can't be used as an escape character.
+ignore-paths=
+
+# Files or directories matching the regular expression patterns are skipped.
+# The regex matches against base names, not paths. The default value ignores
+# Emacs file locks
+ignore-patterns=^\.#
+
+# List of module names for which member attributes should not be checked
+# (useful for modules/projects where namespaces are manipulated during runtime
+# and thus existing member attributes cannot be deduced by static analysis). It
+# supports qualified module names, as well as Unix pattern matching.
+ignored-modules=
+
+# Python code to execute, usually for sys.path manipulation such as
+# pygtk.require().
+#init-hook=
+
+# Use multiple processes to speed up Pylint. Specifying 0 will auto-detect the
+# number of processors available to use, and will cap the count on Windows to
+# avoid hangs.
+jobs=1
+
+# Control the amount of potential inferred values when inferring a single
+# object. This can help the performance when dealing with large functions or
+# complex, nested conditions.
+limit-inference-results=100
+
+# List of plugins (as comma separated values of python module names) to load,
+# usually to register additional checkers.
+load-plugins=
+
+# Pickle collected data for later comparisons.
+persistent=yes
+
+# Minimum Python version to use for version dependent checks. Will default to
+# the version used to run pylint.
+py-version=3.11
+
+# Discover python modules and packages in the file system subtree.
+recursive=no
+
+# Add paths to the list of the source roots. Supports globbing patterns. The
+# source root is an absolute path or a path relative to the current working
+# directory used to determine a package namespace for modules located under the
+# source root.
+source-roots=
+
+# When enabled, pylint would attempt to guess common misconfiguration and emit
+# user-friendly hints instead of false-positive error messages.
+suggestion-mode=yes
+
+# Allow loading of arbitrary C extensions. Extensions are imported into the
+# active Python interpreter and may run arbitrary code.
+unsafe-load-any-extension=no
+
+# In verbose mode, extra non-checker-related info will be displayed.
+#verbose=
+
+
+[BASIC]
+
+# Naming style matching correct argument names.
+argument-naming-style=snake_case
+
+# Regular expression matching correct argument names. Overrides argument-
+# naming-style. If left empty, argument names will be checked with the set
+# naming style.
+#argument-rgx=
+
+# Naming style matching correct attribute names.
+attr-naming-style=snake_case
+
+# Regular expression matching correct attribute names. Overrides attr-naming-
+# style. If left empty, attribute names will be checked with the set naming
+# style.
+#attr-rgx=
+
+# Bad variable names which should always be refused, separated by a comma.
+bad-names=foo,
+          bar,
+          baz,
+          toto,
+          tutu,
+          tata
+
+# Bad variable names regexes, separated by a comma. If names match any regex,
+# they will always be refused
+bad-names-rgxs=
+
+# Naming style matching correct class attribute names.
+class-attribute-naming-style=any
+
+# Regular expression matching correct class attribute names. Overrides class-
+# attribute-naming-style. If left empty, class attribute names will be checked
+# with the set naming style.
+#class-attribute-rgx=
+
+# Naming style matching correct class constant names.
+class-const-naming-style=UPPER_CASE
+
+# Regular expression matching correct class constant names. Overrides class-
+# const-naming-style. If left empty, class constant names will be checked with
+# the set naming style.
+#class-const-rgx=
+
+# Naming style matching correct class names.
+class-naming-style=PascalCase
+
+# Regular expression matching correct class names. Overrides class-naming-
+# style. If left empty, class names will be checked with the set naming style.
+#class-rgx=
+
+# Naming style matching correct constant names.
+const-naming-style=UPPER_CASE
+
+# Regular expression matching correct constant names. Overrides const-naming-
+# style. If left empty, constant names will be checked with the set naming
+# style.
+#const-rgx=
+
+# Minimum line length for functions/classes that require docstrings, shorter
+# ones are exempt.
+docstring-min-length=-1
+
+# Naming style matching correct function names.
+function-naming-style=snake_case
+
+# Regular expression matching correct function names. Overrides function-
+# naming-style. If left empty, function names will be checked with the set
+# naming style.
+#function-rgx=
+
+# Good variable names which should always be accepted, separated by a comma.
+good-names=i,
+           j,
+           k,
+           ex,
+           Run,
+           _
+
+# Good variable names regexes, separated by a comma. If names match any regex,
+# they will always be accepted
+good-names-rgxs=
+
+# Include a hint for the correct naming format with invalid-name.
+include-naming-hint=no
+
+# Naming style matching correct inline iteration names.
+inlinevar-naming-style=any
+
+# Regular expression matching correct inline iteration names. Overrides
+# inlinevar-naming-style. If left empty, inline iteration names will be checked
+# with the set naming style.
+#inlinevar-rgx=
+
+# Naming style matching correct method names.
+method-naming-style=snake_case
+
+# Regular expression matching correct method names. Overrides method-naming-
+# style. If left empty, method names will be checked with the set naming style.
+#method-rgx=
+
+# Naming style matching correct module names.
+module-naming-style=snake_case
+
+# Regular expression matching correct module names. Overrides module-naming-
+# style. If left empty, module names will be checked with the set naming style.
+#module-rgx=
+
+# Colon-delimited sets of names that determine each other's naming style when
+# the name regexes allow several styles.
+name-group=
+
+# Regular expression which should only match function or class names that do
+# not require a docstring.
+no-docstring-rgx=^_
+
+# List of decorators that produce properties, such as abc.abstractproperty. Add
+# to this list to register other decorators that produce valid properties.
+# These decorators are taken in consideration only for invalid-name.
+property-classes=abc.abstractproperty
+
+# Regular expression matching correct type alias names. If left empty, type
+# alias names will be checked with the set naming style.
+#typealias-rgx=
+
+# Regular expression matching correct type variable names. If left empty, type
+# variable names will be checked with the set naming style.
+#typevar-rgx=
+
+# Naming style matching correct variable names.
+variable-naming-style=snake_case
+
+# Regular expression matching correct variable names. Overrides variable-
+# naming-style. If left empty, variable names will be checked with the set
+# naming style.
+#variable-rgx=
+
+
+[CLASSES]
+
+# Warn about protected attribute access inside special methods
+check-protected-access-in-special-methods=no
+
+# List of method names used to declare (i.e. assign) instance attributes.
+defining-attr-methods=__init__,
+                      __new__,
+                      setUp,
+                      __post_init__
+
+# List of member names, which should be excluded from the protected access
+# warning.
+exclude-protected=_asdict,_fields,_replace,_source,_make,os._exit
+
+# List of valid names for the first argument in a class method.
+valid-classmethod-first-arg=cls
+
+# List of valid names for the first argument in a metaclass class method.
+valid-metaclass-classmethod-first-arg=mcs
+
+
+[DESIGN]
+
+# List of regular expressions of class ancestor names to ignore when counting
+# public methods (see R0903)
+exclude-too-few-public-methods=
+
+# List of qualified class names to ignore when counting class parents (see
+# R0901)
+ignored-parents=
+
+# Maximum number of arguments for function / method.
+max-args=5
+
+# Maximum number of attributes for a class (see R0902).
+max-attributes=7
+
+# Maximum number of boolean expressions in an if statement (see R0916).
+max-bool-expr=5
+
+# Maximum number of branch for function / method body.
+max-branches=12
+
+# Maximum number of locals for function / method body.
+max-locals=15
+
+# Maximum number of parents for a class (see R0901).
+max-parents=7
+
+# Maximum number of public methods for a class (see R0904).
+max-public-methods=20
+
+# Maximum number of return / yield for function / method body.
+max-returns=6
+
+# Maximum number of statements in function / method body.
+max-statements=50
+
+# Minimum number of public methods for a class (see R0903).
+min-public-methods=2
+
+
+[EXCEPTIONS]
+
+# Exceptions that will emit a warning when caught.
+overgeneral-exceptions=builtins.BaseException,builtins.Exception
+
+
+[FORMAT]
+
+# Expected format of line ending, e.g. empty (any line ending), LF or CRLF.
+expected-line-ending-format=
+
+# Regexp for a line that is allowed to be longer than the limit.
+ignore-long-lines=^\s*(# )?<?https?://\S+>?$
+
+# Number of spaces of indent required inside a hanging or continued line.
+indent-after-paren=4
+
+# String used as indentation unit. This is usually "    " (4 spaces) or "\t" (1
+# tab).
+indent-string='    '
+
+# Maximum number of characters on a single line.
+max-line-length=100
+
+# Maximum number of lines in a module.
+max-module-lines=1000
+
+# Allow the body of a class to be on the same line as the declaration if body
+# contains single statement.
+single-line-class-stmt=no
+
+# Allow the body of an if to be on the same line as the test if there is no
+# else.
+single-line-if-stmt=no
+
+
+[IMPORTS]
+
+# List of modules that can be imported at any level, not just the top level
+# one.
+allow-any-import-level=
+
+# Allow explicit reexports by alias from a package __init__.
+allow-reexport-from-package=no
+
+# Allow wildcard imports from modules that define __all__.
+allow-wildcard-with-all=no
+
+# Deprecated modules which should not be used, separated by a comma.
+deprecated-modules=
+
+# Output a graph (.gv or any supported image format) of external dependencies
+# to the given file (report RP0402 must not be disabled).
+ext-import-graph=
+
+# Output a graph (.gv or any supported image format) of all (i.e. internal and
+# external) dependencies to the given file (report RP0402 must not be
+# disabled).
+import-graph=
+
+# Output a graph (.gv or any supported image format) of internal dependencies
+# to the given file (report RP0402 must not be disabled).
+int-import-graph=
+
+# Force import order to recognize a module as part of the standard
+# compatibility libraries.
+known-standard-library=
+
+# Force import order to recognize a module as part of a third party library.
+known-third-party=enchant
+
+# Couples of modules and preferred modules, separated by a comma.
+preferred-modules=
+
+
+[LOGGING]
+
+# The type of string formatting that logging methods do. `old` means using %
+# formatting, `new` is for `{}` formatting.
+logging-format-style=old
+
+# Logging modules to check that the string format arguments are in logging
+# function parameter format.
+logging-modules=logging
+
+
+[MESSAGES CONTROL]
+
+# Only show warnings with the listed confidence levels. Leave empty to show
+# all. Valid levels: HIGH, CONTROL_FLOW, INFERENCE, INFERENCE_FAILURE,
+# UNDEFINED.
+confidence=HIGH,
+           CONTROL_FLOW,
+           INFERENCE,
+           INFERENCE_FAILURE,
+           UNDEFINED
+
+# Disable the message, report, category or checker with the given id(s). You
+# can either give multiple identifiers separated by comma (,) or put this
+# option multiple times (only on the command line, not in the configuration
+# file where it should appear only once). You can also use "--disable=all" to
+# disable everything first and then re-enable specific checks. For example, if
+# you want to run only the similarities checker, you can use "--disable=all
+# --enable=similarities". If you want to run only the classes checker, but have
+# no Warning level messages displayed, use "--disable=all --enable=classes
+# --disable=W".
+disable=raw-checker-failed,
+        bad-inline-option,
+        locally-disabled,
+        file-ignored,
+        suppressed-message,
+        useless-suppression,
+        deprecated-pragma,
+        use-symbolic-message-instead
+
+# Enable the message, report, category or checker with the given id(s). You can
+# either give multiple identifier separated by comma (,) or put this option
+# multiple time (only on the command line, not in the configuration file where
+# it should appear only once). See also the "--disable" option for examples.
+enable=c-extension-no-member
+
+
+[METHOD_ARGS]
+
+# List of qualified names (i.e., library.method) which require a timeout
+# parameter e.g. 'requests.api.get,requests.api.post'
+timeout-methods=requests.api.delete,requests.api.get,requests.api.head,requests.api.options,requests.api.patch,requests.api.post,requests.api.put,requests.api.request
+
+
+[MISCELLANEOUS]
+
+# List of note tags to take in consideration, separated by a comma.
+notes=FIXME,
+      XXX,
+      TODO
+
+# Regular expression of note tags to take in consideration.
+notes-rgx=
+
+
+[REFACTORING]
+
+# Maximum number of nested blocks for function / method body
+max-nested-blocks=5
+
+# Complete name of functions that never returns. When checking for
+# inconsistent-return-statements if a never returning function is called then
+# it will be considered as an explicit return statement and no message will be
+# printed.
+never-returning-functions=sys.exit,argparse.parse_error
+
+
+[REPORTS]
+
+# Python expression which should return a score less than or equal to 10. You
+# have access to the variables 'fatal', 'error', 'warning', 'refactor',
+# 'convention', and 'info' which contain the number of messages in each
+# category, as well as 'statement' which is the total number of statements
+# analyzed. This score is used by the global evaluation report (RP0004).
+evaluation=max(0, 0 if fatal else 10.0 - ((float(5 * error + warning + refactor + convention) / statement) * 10))
+
+# Template used to display messages. This is a python new-style format string
+# used to format the message information. See doc for all details.
+msg-template=
+
+# Set the output format. Available formats are text, parseable, colorized, json
+# and msvs (visual studio). You can also give a reporter class, e.g.
+# mypackage.mymodule.MyReporterClass.
+#output-format=
+
+# Tells whether to display a full report or only the messages.
+reports=no
+
+# Activate the evaluation score.
+score=yes
+
+
+[SIMILARITIES]
+
+# Comments are removed from the similarity computation
+ignore-comments=yes
+
+# Docstrings are removed from the similarity computation
+ignore-docstrings=yes
+
+# Imports are removed from the similarity computation
+ignore-imports=yes
+
+# Signatures are removed from the similarity computation
+ignore-signatures=yes
+
+# Minimum lines number of a similarity.
+min-similarity-lines=4
+
+
+[SPELLING]
+
+# Limits count of emitted suggestions for spelling mistakes.
+max-spelling-suggestions=4
+
+# Spelling dictionary name. No available dictionaries : You need to install
+# both the python package and the system dependency for enchant to work..
+spelling-dict=
+
+# List of comma separated words that should be considered directives if they
+# appear at the beginning of a comment and should not be checked.
+spelling-ignore-comment-directives=fmt: on,fmt: off,noqa:,noqa,nosec,isort:skip,mypy:
+
+# List of comma separated words that should not be checked.
+spelling-ignore-words=
+
+# A path to a file that contains the private dictionary; one word per line.
+spelling-private-dict-file=
+
+# Tells whether to store unknown words to the private dictionary (see the
+# --spelling-private-dict-file option) instead of raising a message.
+spelling-store-unknown-words=no
+
+
+[STRING]
+
+# This flag controls whether inconsistent-quotes generates a warning when the
+# character used as a quote delimiter is used inconsistently within a module.
+check-quote-consistency=no
+
+# This flag controls whether the implicit-str-concat should generate a warning
+# on implicit string concatenation in sequences defined over several lines.
+check-str-concat-over-line-jumps=no
+
+
+[TYPECHECK]
+
+# List of decorators that produce context managers, such as
+# contextlib.contextmanager. Add to this list to register other decorators that
+# produce valid context managers.
+contextmanager-decorators=contextlib.contextmanager
+
+# List of members which are set dynamically and missed by pylint inference
+# system, and so shouldn't trigger E1101 when accessed. Python regular
+# expressions are accepted.
+generated-members=
+
+# Tells whether to warn about missing members when the owner of the attribute
+# is inferred to be None.
+ignore-none=yes
+
+# This flag controls whether pylint should warn about no-member and similar
+# checks whenever an opaque object is returned when inferring. The inference
+# can return multiple potential results while evaluating a Python object, but
+# some branches might not be evaluated, which results in partial inference. In
+# that case, it might be useful to still emit no-member and other checks for
+# the rest of the inferred objects.
+ignore-on-opaque-inference=yes
+
+# List of symbolic message names to ignore for Mixin members.
+ignored-checks-for-mixins=no-member,
+                          not-async-context-manager,
+                          not-context-manager,
+                          attribute-defined-outside-init
+
+# List of class names for which member attributes should not be checked (useful
+# for classes with dynamically set attributes). This supports the use of
+# qualified names.
+ignored-classes=optparse.Values,thread._local,_thread._local,argparse.Namespace
+
+# Show a hint with possible names when a member name was not found. The aspect
+# of finding the hint is based on edit distance.
+missing-member-hint=yes
+
+# The minimum edit distance a name should have in order to be considered a
+# similar match for a missing member name.
+missing-member-hint-distance=1
+
+# The total number of similar names that should be taken in consideration when
+# showing a hint for a missing member.
+missing-member-max-choices=1
+
+# Regex pattern to define which classes are considered mixins.
+mixin-class-rgx=.*[Mm]ixin
+
+# List of decorators that change the signature of a decorated function.
+signature-mutators=
+
+
+[VARIABLES]
+
+# List of additional names supposed to be defined in builtins. Remember that
+# you should avoid defining new builtins when possible.
+additional-builtins=
+
+# Tells whether unused global variables should be treated as a violation.
+allow-global-unused-variables=yes
+
+# List of names allowed to shadow builtins
+allowed-redefined-builtins=
+
+# List of strings which can identify a callback function by name. A callback
+# name must start or end with one of those strings.
+callbacks=cb_,
+          _cb
+
+# A regular expression matching the name of dummy variables (i.e. expected to
+# not be used).
+dummy-variables-rgx=_+$|(_[a-zA-Z0-9_]*[a-zA-Z0-9]+?$)|dummy|^ignored_|^unused_
+
+# Argument names that match this expression will be ignored.
+ignored-argument-names=_.*|^ignored_|^unused_
+
+# Tells whether we should check for unused import in __init__ files.
+init-import=no
+
+# List of qualified module names which can have objects that can redefine
+# builtins.
+redefining-builtins-modules=six.moves,past.builtins,future.builtins,builtins,io
diff --git a/check_whence.py b/check_whence.py
index 711be36..c9a54b2 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -1,73 +1,104 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
+""" check_whence """
 
-import os, re, sys
+import os
+import re
+import sys
 from io import open
 
+
 def list_whence():
-    with open('WHENCE', encoding='utf-8') as whence:
+    """
+    list_whence
+    """
+    with open("WHENCE", encoding="utf-8") as whence:
         for line in whence:
             match = re.match(r'(?:File|Source):\s*"(.*)"', line)
             if match:
                 yield match.group(1)
                 continue
-            match = re.match(r'(?:File|Source):\s*(\S*)', line)
+            match = re.match(r"(?:File|Source):\s*(\S*)", line)
             if match:
                 yield match.group(1)
                 continue
-            match = re.match(r'Licen[cs]e: (?:.*\bSee (.*) for details\.?|(\S*))\n',
-                             line)
+            match = re.match(
+                r"Licen[cs]e: (?:.*\bSee (.*) for details\.?|(\S*))\n", line
+            )
             if match:
                 if match.group(1):
-                    for name in re.split(r', | and ', match.group(1)):
+                    for name in re.split(r", | and ", match.group(1)):
                         yield name
                     continue
                 if match.group(2):
                     # Just one word - may or may not be a filename
-                    if not re.search(r'unknown|distributable', match.group(2),
-                                     re.IGNORECASE):
+                    if not re.search(
+                        r"unknown|distributable", match.group(2), re.IGNORECASE
+                    ):
                         yield match.group(2)
                         continue
 
+
 def list_whence_files():
-    with open('WHENCE', encoding='utf-8') as whence:
+    """
+    list_whence_files
+    """
+    with open("WHENCE", encoding="utf-8") as whence:
         for line in whence:
-            match = re.match(r'File:\s*(.*)', line)
+            match = re.match(r"File:\s*(.*)", line)
             if match:
-                yield match.group(1).replace("\ ", " ")
+                yield match.group(1).replace(r"\ ", " ")
                 continue
 
+
 def list_git():
-    with os.popen('git ls-files') as git_files:
+    """
+    list_git
+    """
+    with os.popen("git ls-files") as git_files:
         for line in git_files:
-            yield line.rstrip('\n')
+            yield line.rstrip("\n")
+
 
 def main():
+    """
+    main
+    """
     ret = 0
     whence_list = list(list_whence())
     whence_files = list(list_whence_files())
-    known_files = set(name for name in whence_list if not name.endswith('/')) | \
-                  set(['check_whence.py', 'configure', 'Makefile',
-                       'README', 'copy-firmware.sh', 'WHENCE'])
-    known_prefixes = set(name for name in whence_list if name.endswith('/'))
+    # pylint: disable-next=line-too-long
+    known_files = set(name for name in whence_list if not name.endswith("/")) | set(
+        [
+            "check_whence.py",
+            ".flake8",
+            ".pylintrc",
+            "configure",
+            "Makefile",
+            "README",
+            "copy-firmware.sh",
+            "WHENCE",
+        ]
+    )
+    known_prefixes = set(name for name in whence_list if name.endswith("/"))
     git_files = set(list_git())
 
-    for name in set(name for name in whence_files if name.endswith('/')):
-        sys.stderr.write('E: %s listed in WHENCE as File, but is directory\n' %
-                         name)
+    for name in set(name for name in whence_files if name.endswith("/")):
+        sys.stderr.write(f"E: {name} listed in WHENCE as File, but is directory\n")
         ret = 1
 
     for name in set(fw for fw in whence_files if whence_files.count(fw) > 1):
-        sys.stderr.write('E: %s listed in WHENCE twice\n' % name)
+        sys.stderr.write(f"E: {name} listed in WHENCE twice\n")
         ret = 1
 
     for name in sorted(list(known_files - git_files)):
-        sys.stderr.write('E: %s listed in WHENCE does not exist\n' % name)
+        sys.stderr.write(f"E: {name} listed in WHENCE does not exist\n" % name)
         ret = 1
 
     for name in sorted(list(git_files - known_files)):
         # Ignore subdirectory changelogs and GPG detached signatures
-        if (name.endswith('/ChangeLog') or
-            (name.endswith('.asc') and name[:-4] in known_files)):
+        if name.endswith("/ChangeLog") or (
+            name.endswith(".asc") and name[:-4] in known_files
+        ):
             continue
 
         # Ignore unknown files in known directories
@@ -75,9 +106,10 @@ def main():
             if name.startswith(prefix):
                 break
         else:
-            sys.stderr.write('E: %s not listed in WHENCE\n' % name)
+            sys.stderr.write(f"E: {name} not listed in WHENCE\n")
             ret = 1
     return ret
 
-if __name__ == '__main__':
+
+if __name__ == "__main__":
     sys.exit(main())
-- 
2.40.1

