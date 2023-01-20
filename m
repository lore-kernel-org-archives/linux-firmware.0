Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C912EC05027
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Jan 2023 13:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B1547C433A0; Fri, 20 Jan 2023 13:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9494CC4339E
	for <linux-firmware@kernel.org>; Fri, 20 Jan 2023 13:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674220326;
	bh=UnTEXiry6/+XtCww1jt09oXY5S60ck2FR1rc9waxNNk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NOy5WQvvI1/PSTHJv0B1OmjSEYB4meb+rBEdqgr40cJ3qpfsQ/Hh8DnfEJSSTmzDX
	 AEXzxxSAVPj2lggIEtisgpSHChVM6oydR8P8Z1vgvi2vDn/A7eadRpa9HL1qjRovGX
	 V3IbbNg/lCHG0JOZ+KTc9AhATG/NOZfQBVtcvMGMR0F5/A0/dKi8xNoxyFjxGtwa1f
	 Q7tw6WWXSaPEznvzzcB8t9J5Vk6/nnVVwR3im0W+hSX9an9+RMPuwLSgpe8CPuICeT
	 Y/aeIBuEQGzg5acW2tPGTXpZL4JEJxC5jh5ZWyGmN0JzbfDLWkad5kM57Wv0Qi/azR
	 unW7RPdL9RXIw==
Received: by mail-yb1-f170.google.com with SMTP id b1so1331752ybn.11
        for <linux-firmware@kernel.org>; Fri, 20 Jan 2023 05:12:06 -0800 (PST)
X-Gm-Message-State: AFqh2koREGe98X96NFktQDnpaNVUvdHUYDsPnLb8bUaCJwMRtu3jfI/Y
	Cq83lBN0/rQHDszxJeC4xjLEL+A6Jb8EvzoxgB8=
X-Google-Smtp-Source: AMrXdXt35M6IMge6xhNTSBu4yNXBrAqEHtJd0AO9Yt29SbIkb5E9tSO8ToKIMc3N1tKpxddTpXDdwn3+nBMEcJVtnc4=
X-Received: by 2002:a05:6902:1409:b0:7ca:7f22:5c15 with SMTP id
 z9-20020a056902140900b007ca7f225c15mr2158772ybu.219.1674220325538; Fri, 20
 Jan 2023 05:12:05 -0800 (PST)
MIME-Version: 1.0
References: <20230119204259.507365-1-pbrobinson@gmail.com>
In-Reply-To: <20230119204259.507365-1-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 20 Jan 2023 08:11:54 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6UKHv33ua-tOEcLg32bLxCE-Hqr9sStEzXbokyMhc=jw@mail.gmail.com>
Message-ID: <CA+5PVA6UKHv33ua-tOEcLg32bLxCE-Hqr9sStEzXbokyMhc=jw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Remove obsolete iwlwifi firmwares
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Gregory Greenman <gregory.greenman@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 19, 2023 at 3:43 PM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> With the EOL of the 4.9 LTS kernel I thought it time to review the
> amount and support levels of the iwlwifi firmware as they are now
> getting large and most are unused. Going through each of the remaining
> LTS kernels I looked at the latest supported rev and removed the
> intervening ones that would generally never get laoded.
>
> The firmware reversions have never been raised in any of the LTS
> cycles and interestingly the max rev hasn't been bumped since
> 5.18 yet there have been a number of newer revs sent here since
> then.
>
> With this there's supported revs of firmware available for all
> upstream cards for all supported LTS kernels. For those using
> old non LTS kernels they are unlikely to be bumping firmware and
> the old tagged releases and git is always available.

LGTM.  I'll give Greg a few days to reply before applying.

josh

> Cc: Gregory Greenman <gregory.greenman@intel.com>
>
> Peter Robinson (5):
>   iwlwifi: remove old unsupported older than 4.14 LTS
>   iwlwifi: remove 4.19 and 5.4 intermediate old firmwares
>   iwlwifi: remove 5.4 and 5.10 intermediate old firmwares
>   iwlwifi: remove 5.10 and 5.15 intermediate old firmwares
>   iwlwifi: remove old intermediate 5.15+ firmwares
>
>  WHENCE                            | 276 ------------------------------
>  iwlwifi-1000-3.ucode              | Bin 335056 -> 0 bytes
>  iwlwifi-3168-22.ucode             | Bin 1028092 -> 0 bytes
>  iwlwifi-3168-27.ucode             | Bin 1032436 -> 0 bytes
>  iwlwifi-5000-1.ucode              | Bin 345008 -> 0 bytes
>  iwlwifi-5000-2.ucode              | Bin 353240 -> 0 bytes
>  iwlwifi-6000g2a-5.ucode           | Bin 444128 -> 0 bytes
>  iwlwifi-6000g2b-5.ucode           | Bin 460236 -> 0 bytes
>  iwlwifi-6050-4.ucode              | Bin 463692 -> 0 bytes
>  iwlwifi-7265D-22.ucode            | Bin 1028376 -> 0 bytes
>  iwlwifi-7265D-27.ucode            | Bin 1032740 -> 0 bytes
>  iwlwifi-8000C-22.ucode            | Bin 2120860 -> 0 bytes
>  iwlwifi-8000C-27.ucode            | Bin 2227284 -> 0 bytes
>  iwlwifi-8000C-31.ucode            | Bin 2310116 -> 0 bytes
>  iwlwifi-8265-22.ucode             | Bin 1811984 -> 0 bytes
>  iwlwifi-8265-27.ucode             | Bin 2234528 -> 0 bytes
>  iwlwifi-8265-31.ucode             | Bin 2307104 -> 0 bytes
>  iwlwifi-9000-pu-b0-jf-b0-33.ucode | Bin 2632620 -> 0 bytes
>  iwlwifi-9000-pu-b0-jf-b0-41.ucode | Bin 2620464 -> 0 bytes
>  iwlwifi-9000-pu-b0-jf-b0-43.ucode | Bin 2543536 -> 0 bytes
>  iwlwifi-9260-th-b0-jf-b0-33.ucode | Bin 2637216 -> 0 bytes
>  iwlwifi-9260-th-b0-jf-b0-41.ucode | Bin 2620656 -> 0 bytes
>  iwlwifi-9260-th-b0-jf-b0-43.ucode | Bin 2558176 -> 0 bytes
>  iwlwifi-Qu-b0-hr-b0-48.ucode      | Bin 1106228 -> 0 bytes
>  iwlwifi-Qu-b0-hr-b0-53.ucode      | Bin 1209628 -> 0 bytes
>  iwlwifi-Qu-b0-hr-b0-55.ucode      | Bin 1223144 -> 0 bytes
>  iwlwifi-Qu-b0-hr-b0-62.ucode      | Bin 1329296 -> 0 bytes
>  iwlwifi-Qu-b0-hr-b0-63.ucode      | Bin 1334856 -> 0 bytes
>  iwlwifi-Qu-b0-hr-b0-68.ucode      | Bin 1355836 -> 0 bytes
>  iwlwifi-Qu-b0-hr-b0-71.ucode      | Bin 1364312 -> 0 bytes
>  iwlwifi-Qu-b0-jf-b0-48.ucode      | Bin 1052796 -> 0 bytes
>  iwlwifi-Qu-b0-jf-b0-53.ucode      | Bin 1147104 -> 0 bytes
>  iwlwifi-Qu-b0-jf-b0-55.ucode      | Bin 1163672 -> 0 bytes
>  iwlwifi-Qu-b0-jf-b0-62.ucode      | Bin 1248672 -> 0 bytes
>  iwlwifi-Qu-b0-jf-b0-63.ucode      | Bin 1252748 -> 0 bytes
>  iwlwifi-Qu-b0-jf-b0-68.ucode      | Bin 1275268 -> 0 bytes
>  iwlwifi-Qu-b0-jf-b0-71.ucode      | Bin 1285192 -> 0 bytes
>  iwlwifi-Qu-c0-hr-b0-48.ucode      | Bin 1106248 -> 0 bytes
>  iwlwifi-Qu-c0-hr-b0-53.ucode      | Bin 1209644 -> 0 bytes
>  iwlwifi-Qu-c0-hr-b0-55.ucode      | Bin 1223160 -> 0 bytes
>  iwlwifi-Qu-c0-hr-b0-62.ucode      | Bin 1329312 -> 0 bytes
>  iwlwifi-Qu-c0-hr-b0-63.ucode      | Bin 1334872 -> 0 bytes
>  iwlwifi-Qu-c0-hr-b0-68.ucode      | Bin 1355852 -> 0 bytes
>  iwlwifi-Qu-c0-hr-b0-71.ucode      | Bin 1364328 -> 0 bytes
>  iwlwifi-Qu-c0-jf-b0-48.ucode      | Bin 1052816 -> 0 bytes
>  iwlwifi-Qu-c0-jf-b0-53.ucode      | Bin 1147120 -> 0 bytes
>  iwlwifi-Qu-c0-jf-b0-55.ucode      | Bin 1163688 -> 0 bytes
>  iwlwifi-Qu-c0-jf-b0-62.ucode      | Bin 1248688 -> 0 bytes
>  iwlwifi-Qu-c0-jf-b0-63.ucode      | Bin 1252764 -> 0 bytes
>  iwlwifi-Qu-c0-jf-b0-68.ucode      | Bin 1275284 -> 0 bytes
>  iwlwifi-Qu-c0-jf-b0-71.ucode      | Bin 1285208 -> 0 bytes
>  iwlwifi-QuZ-a0-hr-b0-48.ucode     | Bin 1105668 -> 0 bytes
>  iwlwifi-QuZ-a0-hr-b0-53.ucode     | Bin 1209628 -> 0 bytes
>  iwlwifi-QuZ-a0-hr-b0-55.ucode     | Bin 1223140 -> 0 bytes
>  iwlwifi-QuZ-a0-hr-b0-62.ucode     | Bin 1328924 -> 0 bytes
>  iwlwifi-QuZ-a0-hr-b0-63.ucode     | Bin 1334804 -> 0 bytes
>  iwlwifi-QuZ-a0-hr-b0-67.ucode     | Bin 1347524 -> 0 bytes
>  iwlwifi-QuZ-a0-hr-b0-68.ucode     | Bin 1355800 -> 0 bytes
>  iwlwifi-QuZ-a0-hr-b0-71.ucode     | Bin 1364308 -> 0 bytes
>  iwlwifi-QuZ-a0-jf-b0-48.ucode     | Bin 1052608 -> 0 bytes
>  iwlwifi-QuZ-a0-jf-b0-53.ucode     | Bin 1147104 -> 0 bytes
>  iwlwifi-QuZ-a0-jf-b0-55.ucode     | Bin 1163668 -> 0 bytes
>  iwlwifi-QuZ-a0-jf-b0-62.ucode     | Bin 1248672 -> 0 bytes
>  iwlwifi-QuZ-a0-jf-b0-63.ucode     | Bin 1252744 -> 0 bytes
>  iwlwifi-QuZ-a0-jf-b0-68.ucode     | Bin 1275264 -> 0 bytes
>  iwlwifi-QuZ-a0-jf-b0-71.ucode     | Bin 1285188 -> 0 bytes
>  iwlwifi-cc-a0-46.ucode            | Bin 1044452 -> 0 bytes
>  iwlwifi-cc-a0-48.ucode            | Bin 1096704 -> 0 bytes
>  iwlwifi-cc-a0-53.ucode            | Bin 1205332 -> 0 bytes
>  iwlwifi-cc-a0-55.ucode            | Bin 1219356 -> 0 bytes
>  iwlwifi-cc-a0-62.ucode            | Bin 1292672 -> 0 bytes
>  iwlwifi-cc-a0-63.ucode            | Bin 1298688 -> 0 bytes
>  iwlwifi-cc-a0-67.ucode            | Bin 1310488 -> 0 bytes
>  iwlwifi-cc-a0-68.ucode            | Bin 1314392 -> 0 bytes
>  iwlwifi-cc-a0-71.ucode            | Bin 1322288 -> 0 bytes
>  iwlwifi-so-a0-gf-a0-64.ucode      | Bin 1515812 -> 0 bytes
>  iwlwifi-so-a0-gf-a0-67.ucode      | Bin 1524432 -> 0 bytes
>  iwlwifi-so-a0-gf-a0-68.ucode      | Bin 1533812 -> 0 bytes
>  iwlwifi-so-a0-gf-a0-71.ucode      | Bin 1550124 -> 0 bytes
>  iwlwifi-so-a0-gf4-a0-67.ucode     | Bin 1541932 -> 0 bytes
>  iwlwifi-so-a0-gf4-a0-68.ucode     | Bin 1552216 -> 0 bytes
>  iwlwifi-so-a0-gf4-a0-71.ucode     | Bin 1566352 -> 0 bytes
>  iwlwifi-so-a0-hr-b0-64.ucode      | Bin 1427384 -> 0 bytes
>  iwlwifi-so-a0-hr-b0-68.ucode      | Bin 1429192 -> 0 bytes
>  iwlwifi-so-a0-hr-b0-71.ucode      | Bin 1456960 -> 0 bytes
>  iwlwifi-so-a0-jf-b0-64.ucode      | Bin 1365628 -> 0 bytes
>  iwlwifi-so-a0-jf-b0-68.ucode      | Bin 1378284 -> 0 bytes
>  iwlwifi-so-a0-jf-b0-71.ucode      | Bin 1400056 -> 0 bytes
>  iwlwifi-ty-a0-gf-a0-62.ucode      | Bin 1455104 -> 0 bytes
>  iwlwifi-ty-a0-gf-a0-63.ucode      | Bin 1460012 -> 0 bytes
>  iwlwifi-ty-a0-gf-a0-67.ucode      | Bin 1482872 -> 0 bytes
>  iwlwifi-ty-a0-gf-a0-68.ucode      | Bin 1494304 -> 0 bytes
>  iwlwifi-ty-a0-gf-a0-71.ucode      | Bin 1494024 -> 0 bytes
>  93 files changed, 276 deletions(-)
>  delete mode 100644 iwlwifi-1000-3.ucode
>  delete mode 100644 iwlwifi-3168-22.ucode
>  delete mode 100644 iwlwifi-3168-27.ucode
>  delete mode 100644 iwlwifi-5000-1.ucode
>  delete mode 100644 iwlwifi-5000-2.ucode
>  delete mode 100644 iwlwifi-6000g2a-5.ucode
>  delete mode 100644 iwlwifi-6000g2b-5.ucode
>  delete mode 100644 iwlwifi-6050-4.ucode
>  delete mode 100644 iwlwifi-7265D-22.ucode
>  delete mode 100644 iwlwifi-7265D-27.ucode
>  delete mode 100644 iwlwifi-8000C-22.ucode
>  delete mode 100644 iwlwifi-8000C-27.ucode
>  delete mode 100644 iwlwifi-8000C-31.ucode
>  delete mode 100644 iwlwifi-8265-22.ucode
>  delete mode 100644 iwlwifi-8265-27.ucode
>  delete mode 100644 iwlwifi-8265-31.ucode
>  delete mode 100644 iwlwifi-9000-pu-b0-jf-b0-33.ucode
>  delete mode 100644 iwlwifi-9000-pu-b0-jf-b0-41.ucode
>  delete mode 100644 iwlwifi-9000-pu-b0-jf-b0-43.ucode
>  delete mode 100644 iwlwifi-9260-th-b0-jf-b0-33.ucode
>  delete mode 100644 iwlwifi-9260-th-b0-jf-b0-41.ucode
>  delete mode 100644 iwlwifi-9260-th-b0-jf-b0-43.ucode
>  delete mode 100644 iwlwifi-Qu-b0-hr-b0-48.ucode
>  delete mode 100644 iwlwifi-Qu-b0-hr-b0-53.ucode
>  delete mode 100644 iwlwifi-Qu-b0-hr-b0-55.ucode
>  delete mode 100644 iwlwifi-Qu-b0-hr-b0-62.ucode
>  delete mode 100644 iwlwifi-Qu-b0-hr-b0-63.ucode
>  delete mode 100644 iwlwifi-Qu-b0-hr-b0-68.ucode
>  delete mode 100644 iwlwifi-Qu-b0-hr-b0-71.ucode
>  delete mode 100644 iwlwifi-Qu-b0-jf-b0-48.ucode
>  delete mode 100644 iwlwifi-Qu-b0-jf-b0-53.ucode
>  delete mode 100644 iwlwifi-Qu-b0-jf-b0-55.ucode
>  delete mode 100644 iwlwifi-Qu-b0-jf-b0-62.ucode
>  delete mode 100644 iwlwifi-Qu-b0-jf-b0-63.ucode
>  delete mode 100644 iwlwifi-Qu-b0-jf-b0-68.ucode
>  delete mode 100644 iwlwifi-Qu-b0-jf-b0-71.ucode
>  delete mode 100644 iwlwifi-Qu-c0-hr-b0-48.ucode
>  delete mode 100644 iwlwifi-Qu-c0-hr-b0-53.ucode
>  delete mode 100644 iwlwifi-Qu-c0-hr-b0-55.ucode
>  delete mode 100644 iwlwifi-Qu-c0-hr-b0-62.ucode
>  delete mode 100644 iwlwifi-Qu-c0-hr-b0-63.ucode
>  delete mode 100644 iwlwifi-Qu-c0-hr-b0-68.ucode
>  delete mode 100644 iwlwifi-Qu-c0-hr-b0-71.ucode
>  delete mode 100644 iwlwifi-Qu-c0-jf-b0-48.ucode
>  delete mode 100644 iwlwifi-Qu-c0-jf-b0-53.ucode
>  delete mode 100644 iwlwifi-Qu-c0-jf-b0-55.ucode
>  delete mode 100644 iwlwifi-Qu-c0-jf-b0-62.ucode
>  delete mode 100644 iwlwifi-Qu-c0-jf-b0-63.ucode
>  delete mode 100644 iwlwifi-Qu-c0-jf-b0-68.ucode
>  delete mode 100644 iwlwifi-Qu-c0-jf-b0-71.ucode
>  delete mode 100644 iwlwifi-QuZ-a0-hr-b0-48.ucode
>  delete mode 100644 iwlwifi-QuZ-a0-hr-b0-53.ucode
>  delete mode 100644 iwlwifi-QuZ-a0-hr-b0-55.ucode
>  delete mode 100644 iwlwifi-QuZ-a0-hr-b0-62.ucode
>  delete mode 100644 iwlwifi-QuZ-a0-hr-b0-63.ucode
>  delete mode 100644 iwlwifi-QuZ-a0-hr-b0-67.ucode
>  delete mode 100644 iwlwifi-QuZ-a0-hr-b0-68.ucode
>  delete mode 100644 iwlwifi-QuZ-a0-hr-b0-71.ucode
>  delete mode 100644 iwlwifi-QuZ-a0-jf-b0-48.ucode
>  delete mode 100644 iwlwifi-QuZ-a0-jf-b0-53.ucode
>  delete mode 100644 iwlwifi-QuZ-a0-jf-b0-55.ucode
>  delete mode 100644 iwlwifi-QuZ-a0-jf-b0-62.ucode
>  delete mode 100644 iwlwifi-QuZ-a0-jf-b0-63.ucode
>  delete mode 100644 iwlwifi-QuZ-a0-jf-b0-68.ucode
>  delete mode 100644 iwlwifi-QuZ-a0-jf-b0-71.ucode
>  delete mode 100644 iwlwifi-cc-a0-46.ucode
>  delete mode 100644 iwlwifi-cc-a0-48.ucode
>  delete mode 100644 iwlwifi-cc-a0-53.ucode
>  delete mode 100644 iwlwifi-cc-a0-55.ucode
>  delete mode 100644 iwlwifi-cc-a0-62.ucode
>  delete mode 100644 iwlwifi-cc-a0-63.ucode
>  delete mode 100644 iwlwifi-cc-a0-67.ucode
>  delete mode 100644 iwlwifi-cc-a0-68.ucode
>  delete mode 100644 iwlwifi-cc-a0-71.ucode
>  delete mode 100644 iwlwifi-so-a0-gf-a0-64.ucode
>  delete mode 100644 iwlwifi-so-a0-gf-a0-67.ucode
>  delete mode 100644 iwlwifi-so-a0-gf-a0-68.ucode
>  delete mode 100644 iwlwifi-so-a0-gf-a0-71.ucode
>  delete mode 100644 iwlwifi-so-a0-gf4-a0-67.ucode
>  delete mode 100644 iwlwifi-so-a0-gf4-a0-68.ucode
>  delete mode 100644 iwlwifi-so-a0-gf4-a0-71.ucode
>  delete mode 100644 iwlwifi-so-a0-hr-b0-64.ucode
>  delete mode 100644 iwlwifi-so-a0-hr-b0-68.ucode
>  delete mode 100644 iwlwifi-so-a0-hr-b0-71.ucode
>  delete mode 100644 iwlwifi-so-a0-jf-b0-64.ucode
>  delete mode 100644 iwlwifi-so-a0-jf-b0-68.ucode
>  delete mode 100644 iwlwifi-so-a0-jf-b0-71.ucode
>  delete mode 100644 iwlwifi-ty-a0-gf-a0-62.ucode
>  delete mode 100644 iwlwifi-ty-a0-gf-a0-63.ucode
>  delete mode 100644 iwlwifi-ty-a0-gf-a0-67.ucode
>  delete mode 100644 iwlwifi-ty-a0-gf-a0-68.ucode
>  delete mode 100644 iwlwifi-ty-a0-gf-a0-71.ucode
>
> --
> 2.39.1
>
