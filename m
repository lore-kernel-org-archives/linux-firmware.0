Return-Path: <SRS0=dEQg=RG=gmail.com=superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF0BCEDDB8
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Oct 2024 03:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84792C4CECD; Thu, 10 Oct 2024 03:25:20 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 878E6C4CEC6
	for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 03:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 878E6C4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3e4d624ac53so209141b6e.2
        for <linux-firmware@kernel.org>; Wed, 09 Oct 2024 20:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728530718; x=1729135518; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sm77+dmWp9c055NQXLkEEi2P3p5z1gBz9VheTDjPWwM=;
        b=gHjrSZ4yusHhB7aRUI9nzcFCx2itDbdRvvDFx8T9n6l5HoxmDeo72IZui0eRTpgWPp
         gs2F4jR57AQMOfBoDQBhYKWWHxHGY86EUptaS1vAuGkvNljzIW6gfDyoSEZJZUOb4BYp
         baJKMEC5VNNO6H3R+y/1yby0ZWfNd5OPGu6jz4/S4NmT0DBkCy8uvvPt5nrHdMh+zKGp
         VEWNOcejBaC6iu6cy9bf7I1DzBNje1JmVZUi73cx1tUG1mZ2h2UT2VCS5raPoajAMB2w
         WlVPOzEWNVKf3H02KCeVuYE9NBrfU6BG269oayG96/jrwG11ljZb5Y2jDyAeOlcY9Mu8
         M7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728530718; x=1729135518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sm77+dmWp9c055NQXLkEEi2P3p5z1gBz9VheTDjPWwM=;
        b=UWJNa+tiRHvdCasbB0cbVQv7XpouInJKWMg9d5YrUjK1WWcNkvUrAAqokHe0v/cKKX
         fvEcoKP3eRoHTuv8CajW/DQdtSZYPi7NfyPE/P+6jiRTPh8CfGg2yCPt43arsXsNj49i
         S5S7dCWeYzusUO4+o8dlysKUBWIVT0Qgma84zdGYAwrEEjySy7QLmln8jE7qmi3U+bfJ
         15/ew+kZ04OtEb0QFKo1FS4LW5CTSUNpj55glSSK/H7CKJw/M+o/hSW2QACnGgqaLppc
         Y+z8D0FPoc4j5/b9fnrSqWfJReNSw4nyIm9wq7mFs78G8UvabFcDRocR6rwysdJsed0M
         lnyg==
X-Forwarded-Encrypted: i=1; AJvYcCVgEyX/xYSUl2XXGGtaZzcqbSDT4aNTPmFHvGpowqR7cTef59rUn6dZufpmsjVbZaXot2dCayKS2pGjBHeoOQ==@kernel.org
X-Gm-Message-State: AOJu0Yyf7kSM0UrCqkrw93IwDq8BqKpaI5zBo0+NGy4x8yKvY6QQ0mJZ
	oLtxHJI5qsktaWCMpgF5c5OoVMgdr9uZqDtPPVvw9XUKNlDvC97hTMbeuqs/
X-Google-Smtp-Source: AGHT+IGFZjdl2XQM/e3pqqp6WDSYsGza1hDy7uFYgjtO2FyTMWIsKzbWboRDkVOn8e2pmxgBnJ2MzA==
X-Received: by 2002:a05:6808:1295:b0:3e3:a282:2a47 with SMTP id 5614622812f47-3e3e670b937mr3719435b6e.14.1728530718450;
        Wed, 09 Oct 2024 20:25:18 -0700 (PDT)
Received: from ?IPV6:2603:8080:1400:9f00:1ac8:ba3e:b226:eb6a? ([2603:8080:1400:9f00:1ac8:ba3e:b226:eb6a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e5150230eesm50590b6e.47.2024.10.09.20.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 20:25:17 -0700 (PDT)
Message-ID: <aef3385b-2d9e-4dc0-9762-8cbf92beb08c@gmail.com>
Date: Wed, 9 Oct 2024 22:25:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/16] Range of copy-firmware/check_whence fixes
List-Id: <linux-firmware.lore.kernel.org>
To: emil.l.velikov@gmail.com, linux-firmware@kernel.org
Cc: Juerg Haefliger <juerg.haefliger@canonical.com>
References: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@gmail.com>
In-Reply-To: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/23/24 08:09, Emil Velikov via B4 Relay wrote:
> Hello all,
> 
> With the latest python 3.12 check_whence.py started throwing some
> warnings. The more I looked around, the more loose ends and bugs reared
> their (ugly) heads.
> 
> In this series:
>   - check_whence.py: sort the filenames, use consistent variable names
>   - check_whence.py: fix links-to-links and band them
>   - editorconfig: add the config and fix the yaml+sh indentation
>   - copy-firmware.sh: factor out dedup fix broken ad-hoc symlink handling
>   - copy-firmware.sh: remove the hacky argument injection
>   - copy-firmware.sh: warn if the destination folder is NOT empty
>   - copy-firmware.sh: call ./check_whence.py and remove the dead code
> 
> The series is a mix of cosmetics (style, names), existing bug fixes and
> trying loose ends. I'm happy to split it in sub-series, as per your
> suggestions.
> 
> As always, input is highly appreciated. Thanks o/
> 
> To: linux-firmware@kernel.org

Hi,

I passed this into a MR in Gitlab and it fails CI.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/316

Can you please run `make check` before submitting again?

Also ideally please submit a MR instead of an email.  Then you can force 
push until CI passes or take into account any feedback.

Thanks!
> 
> Changes in v2:
> - Commit message tweaks
> - Correct a few flipped test checks
> - Rename deduplicate-firmware.sh to dedup-firmware.sh
> - Change line width (editorconfig) to 90
> - Properly handle destdir
> - Link to v1: https://lore.kernel.org/r/20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com
> 
> ---
> Emil Velikov (16):
>        check_whence.py: use consistent naming
>        check_whence.py: ban link-to-a-link
>        check_whence.py: LC_ALL=C sort -u the filelist
>        check_whence.py: annotate replacement strings as raw
>        editorconfig: add initial config file
>        Style update yaml files
>        copy-firmware.sh: flesh out and fix dedup-firmware.sh
>        Revert "copy-firmware: Support additional compressor options"
>        copy-firmware.sh: reset and consistently handle destdir
>        copy-firmware.sh: fix indentation
>        copy-firmware.sh: add err() helper
>        copy-firmware.sh: warn if the destination folder is not empty
>        copy-firmware.sh: call ./check_whence.py before parsing the file
>        copy-firmware.sh: remove no longer reachable test -f
>        copy-firmware.sh: remove no longer reachable test -L
>        copy-firmware.sh: rename variables in symlink hanlding
> 
>   .editorconfig           |  21 +++++++++
>   .gitlab-ci.yml          |   2 +-
>   .pre-commit-config.yaml |  38 ++++++++--------
>   Makefile                |   9 ++--
>   WHENCE                  |  14 +++---
>   check_whence.py         |  42 +++++++++++-------
>   copy-firmware.sh        | 113 +++++++++++++-----------------------------------
>   dedup-firmware.sh       |  52 ++++++++++++++++++++++
>   8 files changed, 162 insertions(+), 129 deletions(-)
> ---
> base-commit: 6c88d9b8253b8ec6df701a551a56438ea2e5bacf
> change-id: 20240922-misc-fixes-8a13acc71a93
> 
> Best regards,

