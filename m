Return-Path: <SRS0=uc4l=RV=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB01D149E7
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Oct 2024 19:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70553C4CECC; Fri, 25 Oct 2024 19:28:34 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59850C4CEC3;
	Fri, 25 Oct 2024 19:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59850C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so25310401fa.0;
        Fri, 25 Oct 2024 12:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729884511; x=1730489311; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O3IqN5w4yIoIrvL/N0HL0c1KYZKAX4YCrPI9aCafY1s=;
        b=AtjnEOaB03sYU2zZS3AmZKif/kib/Acg0Qy7V9GsM5hntUGj5wFy4PmDEDet86Uk/q
         6UhlC/ZiIxRoKwkVpnSSDox2k3o4dPtBU3L0Q9wvnojuUpwMK5SqEBv9GRGyz59ea4KE
         qt+/GQhUYjZgtUJeTNaUZM+Rrao2nS2h2Tr/h8VFRoQ+7/r2cvaRxOdXrK1cw8wypR+F
         AKT/jfc6s6sjKY777Id7VeUT2O+hRMxLHbO3Ay/B7Kz/LpZ1MRdpsF/uMKeghnSR0J7s
         aS+wpsDO40jB96YstDKQ3A/xFFmDkkkWjZc/qH/WFgkrj+EOyukGK5YsshevzwTPIBlE
         PKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729884511; x=1730489311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3IqN5w4yIoIrvL/N0HL0c1KYZKAX4YCrPI9aCafY1s=;
        b=dEnf6tZMh+S7gN/TknmTNRJjhLlQo2PJ9J8fPlyhQSCNZbJPjmgROKuxf6fpIAuA7l
         P1p0Gpn4efrDhQ1w0zJdvqiKgnwjfLjgcCkiuIqCCHQUm8JGnfzvBImlK6FMm7CfHAy1
         x2PPIRUM3y1MQNVPfWMZOJy8JGfCjZm9fXAz853KSLcKSdFpmbs1ZvC5DYqMTEwSbJXT
         yx5qklIifR834BrWZUitSYbF5HzrjFNVgF7gvM9aqvFKZsxOwE/EEionKcvB1tDtc9t1
         M7wk8eFIJmIBkAI/UJxZm1vP7+8V2owWWDsO/UEI3oBzN8aZ8JXFLaOOAI0XD/XFTzRP
         rZUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOQ5kh4T8i1EmQNbidXo4IOW/otyJHxt5CznvZjP5ZPZNyttJg3HG/P3qFbfzmk7KR4tK1Yuuw6MGE+8jB5w==@kernel.org
X-Gm-Message-State: AOJu0YxByz7wIufTheJPCNLNSUozRqWzlDHJdO80vgB9rEv8OcO7xun8
	c2Z6y4lW6Jb5kCN8WM6iUdwfD7Lp1boinrWhz5MYViNFexr9AodNNVDkS2ndzOclrhWbyCVRxfU
	XbLcPbxWFbuhMOK+NVrJopX30532WBOID
X-Google-Smtp-Source: AGHT+IFsMBnQ25/n+l62xKjL6JRezqdNgp0elN160uK4cByEYCMWbEzBcJQstieXsXmf4NUoHjRQekIOYFgCgaLuviE=
X-Received: by 2002:a2e:a546:0:b0:2fa:dcb6:fa7a with SMTP id
 38308e7fff4ca-2fcbdf76dc3mr2147501fa.11.1729884511173; Fri, 25 Oct 2024
 12:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <56dd4ed2-a4a2-4d9d-b23b-2a817fca1f94@quicinc.com>
 <CA+5PVA65e_3w-gh-ZQPS8PDzxyPNZ_NNFcp7TcMhWi0pNO-x+g@mail.gmail.com>
 <CACvgo520miap4jYcKOgirscGzhZiM3TzrT8-18FTZ16gZ7ERhw@mail.gmail.com>
 <c37774af-29b0-4b5d-9793-78e976b8e81d@quicinc.com> <CACvgo511jG-4a6Ry1uTiSNHeaswMoXWDkDR6W7YQUT0yGL3mQg@mail.gmail.com>
 <84586ef0-9108-4fdd-b3b5-fd9d15710612@quicinc.com> <dee84263-2885-4fcd-a42f-c59042809ccf@quicinc.com>
In-Reply-To: <dee84263-2885-4fcd-a42f-c59042809ccf@quicinc.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 25 Oct 2024 20:28:18 +0100
Message-ID: <CACvgo50DDs39F42bK-iXEr0+H_pgL5YuAjCpsXJ24vM7nZo+hg@mail.gmail.com>
Subject: Re: check_whence.py: Add function to get listing of files
To: Vivek Puar <quic_vpuar@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey,

On Fri, 25 Oct 2024 at 07:22, Vivek Puar <quic_vpuar@quicinc.com> wrote:
>
> Hi Emil,
>
> Is this patch good to be picked so that check_whence.py check can be mandated and not ignored?
>

Not ignored, just slipped under the radar since it's an attachment and
not inline. Either way, thanks for the poke o/

Some comments inline:

> From 306d081594df8a449d07565217153c40b6136646 Mon Sep 17 00:00:00 2001
> From: Vivek Puar <quic_vpuar@quicinc.com>
> Date: Wed, 23 Oct 2024 00:32:57 +0530
> Subject: [PATCH] check_whence.py: Add function to get listing of files
>

Summary should focus a bit on why aka "Fallback to local file listing,
when git fails" or anything along those lines


> Commit [1] introduces check_whence.py inside
> copy-firmware.sh before the firmware is consumed.
>
> But current check_whence.py supports only git
> repo, and it will cause error when linux-firmware tar
> is used, as it will not be a git repo.
>
> So adding a check to parse local directory to create
> a set of files to validate it with WHENCE file.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=6edd0fd36acb93c8075bbd700ad91f53fc810c0e
>
> Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
> ---
>  check_whence.py | 36 ++++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 12 deletions(-)
>
> diff --git a/check_whence.py b/check_whence.py
> index 1fece4f4..1ea75a68 100755
> --- a/check_whence.py
> +++ b/check_whence.py
> @@ -1,6 +1,6 @@
>  #!/usr/bin/python3
>
> -import os, re, stat, sys
> +import os, re, stat, sys, subprocess
>  from io import open
>
>
> @@ -60,12 +60,21 @@ def list_links_list():
>
>
>  def list_git():
> -    git_files = os.popen("git ls-files")
> -    for line in git_files:
> -        yield line.rstrip("\n")
> +    try:
> +        subprocess.check_output(['git', 'rev-parse', '--is-inside-work-tree'], stderr=subprocess.STDOUT)

I thought rev-parse is not meant for end-users... When was the
argument introduced, will it disappear at some point? Maybe we can use
something else instead?

 - check that .git exists, if so try git ls-files
 - if the latter fails, but print indicative message depending if .git exists
    - missing "doesn't seem like a git repo, falling back to local file listing"
    - available "git command failed check above log and address the issue"

All the examples and just random ones I pulled out of thin air. Please
use your judgement and opt for something better if it comes to mind.

> +def list_dir():
> +    pwd = os.getcwd()
> +    # Parse every directory to create set of files to be matched with WHENCE entries
> +    for root, dirs, files in os.walk(pwd):
> +        for file in files:
> +            yield os.path.relpath(os.path.join(root, file.rstrip("\n")), pwd)
>

This listing should exclude anything under .git. Otherwise we'll get
thousands of entries when the repository is available and git fails
due to $REASON.
Speaking of reason, some CI will have different file/group ownership
so git will fail, unless `safe.directory` is set. Pretty sure there
are various others.

>  def main():
> @@ -97,7 +106,10 @@ def main():
>          ]
>      )
>      known_prefixes = set(name for name in whence_list if name.endswith("/"))
> -    git_files = set(list_git())
> +    files_set = set(list_git())
> +    # If it is not git repo call list_dir()

There are various reasons why list_git() can fail, so I'd just drop
the comment. While in there local_files is a more indicative name than
files_set.

> +    if not files_set:
> +        files_set = set(list_dir())

If we cannot get any files from git ls-files and os.walk() something
is horribly wrong and we should probably error out _early_ and
_loudly_.

>      executable_files = set(
>          [
>              "build_packages.py",
> @@ -138,12 +150,12 @@ def main():
>              )
>              ret = 1
>
> -    for name in sorted(list(known_files - git_files) if len(git_files) else list()):
> +    for name in sorted(list(known_files - files_set) if len(files_set) else list()):

Then the if part of this statement can be removed.

>      # ... or to a directory
>      for target in set(valid_targets):
> @@ -154,14 +166,14 @@ def main():
>                  break
>              valid_targets.add(dirname)
>
> -    for link, target in sorted(links_list if len(git_files) else list()):
> +    for link, target in sorted(links_list if len(files_set) else list()):

As does this one.

HTH
Emil
