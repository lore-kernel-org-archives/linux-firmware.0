Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D444C54EBD
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Jan 2023 14:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4E1FC43396; Mon,  9 Jan 2023 14:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3EEC433F1
	for <linux-firmware@kernel.org>; Mon,  9 Jan 2023 14:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673273563;
	bh=UBI2imG+kIHVUIylLnXXMpLZvx9+z+DhoOfgsoyB0RI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mui0bJWtti9iHtDkyMKqa/WTmV7ECqzffqUozxHK3dAAsEURsD/bTCVk8wWcZkPQz
	 +qRZetAtMaG4vvmho7g+DkVSUk42+5C9GJNSSjVobtyY8IYQ9K/ZASg2LlFgWM0uzc
	 DbCv+ZjJvAXpHp9TUEVGtYJl/e8Izv+NvIP4u7QIPEn5lMXAPApHUj0n0VIoHdyzKS
	 UG7KyIv/Myu0bQsBYq54XMmUYBLNESj6wLGeHZIhJRIeDWTGlSlLra3kzkv7vWYw76
	 71ksrw3zSPgCnqbdzaGcjUHT5qAbQ5YM5PfmWj34gG9V0RipSmQLTw6mi/Qm3iUwQq
	 bHvb51vZEcARg==
Received: by mail-yb1-f177.google.com with SMTP id c82so1350866ybf.6
        for <linux-firmware@kernel.org>; Mon, 09 Jan 2023 06:12:43 -0800 (PST)
X-Gm-Message-State: AFqh2kqG8WFALn2UQ/IGnK4YkuxpILCtO7Zy2+LXWFy7UQWDp1CUMPQW
	XgQToUUbtMHce2gTH7cQrk02E3YYdMYz+x23PRs=
X-Google-Smtp-Source: AMrXdXvF07ujODGWC4TDuzTDdfHuUNlIdKazBXrO9mCyKrT8zhpK3gsG1EKVUvZQPdwvlBKBhxQaOKvclL2FjAli9WI=
X-Received: by 2002:a25:284:0:b0:7ba:f508:2ab0 with SMTP id
 126-20020a250284000000b007baf5082ab0mr506931ybc.471.1673273562757; Mon, 09
 Jan 2023 06:12:42 -0800 (PST)
MIME-Version: 1.0
References: <0f2d6fb13fe09bc7cd0a74d7c57cdbc03f979071.camel@intel.com>
In-Reply-To: <0f2d6fb13fe09bc7cd0a74d7c57cdbc03f979071.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 9 Jan 2023 09:12:31 -0500
X-Gmail-Original-Message-ID: <CA+5PVA63L6h+j+0J2bLn3fB7qWdOk34tapuF2N0kUftzUyZHVA@mail.gmail.com>
Message-ID: <CA+5PVA63L6h+j+0J2bLn3fB7qWdOk34tapuF2N0kUftzUyZHVA@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2023-01-04
To: "Greenman, Gregory" <gregory.greenman@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"kyle@infradead.org" <kyle@infradead.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 4, 2023 at 4:09 PM Greenman, Gregory
<gregory.greenman@intel.com> wrote:
>
> Hi,
>
> This contains some new firmwares for all our currently maintained FW binaries.
>
> Please pull or let me know if there are any issues.
>
> --
> Thanks
> Gregory
>
> The following changes since commit 4ee201478d3f063fd8296d773aeeaf0d72bfb80f:
>
>   Merge branch 'for-upstream' of http://git.chelsio.net/pub/git/linux-firmware (2023-01-04 08:22:15 -0500)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2023-01-04
>
> for you to fetch changes up to def1e169a7fe571eb1a0fd306c8fc8851906b7df:
>
>   iwlwifi: add new FWs from core76-35 release (2023-01-04 22:50:08 +0200)
>
> ----------------------------------------------------------------
> Firmware updates for iwlwifi:
> * updates for 9000-family
> * add new firmwares (ty/so) from release core75-47
> * update cc/Qu/QuZ firmwares from core76-35
> * add new FWs (ty/so) from core76-35
>
> ----------------------------------------------------------------
> Gregory Greenman (4):
>       iwlwifi: update 9000-family firmwares to core75-47
>       iwlwifi: add new FWs from core75-47 release
>       iwlwifi: update cc/Qu/QuZ firmwares for core76-35 release
>       iwlwifi: add new FWs from core76-35 release
>
>  WHENCE                            |  37 +++++++++++++++++++++++++++++--------

This seems to miss adding a firmware file?

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: iwlwifi-so-a0-gf-a0-79.ucode listed in WHENCE does not exist
[jwboyer@vader linux-firmware]$

>  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1518788 -> 1518788 bytes
>  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1489668 -> 1489668 bytes
>  iwlwifi-Qu-b0-hr-b0-77.ucode      | Bin 1407736 -> 1404048 bytes
>  iwlwifi-Qu-b0-jf-b0-77.ucode      | Bin 1325500 -> 1321720 bytes
>  iwlwifi-Qu-c0-hr-b0-77.ucode      | Bin 1407752 -> 1404064 bytes
>  iwlwifi-Qu-c0-jf-b0-77.ucode      | Bin 1325516 -> 1321736 bytes
>  iwlwifi-QuZ-a0-hr-b0-77.ucode     | Bin 1406756 -> 1404184 bytes
>  iwlwifi-cc-a0-77.ucode            | Bin 1369192 -> 1365484 bytes
>  iwlwifi-so-a0-gf-a0-78.ucode      | Bin 0 -> 1667236 bytes
>  iwlwifi-so-a0-gf-a0.pnvm          | Bin 42092 -> 56048 bytes
>  iwlwifi-so-a0-gf4-a0-78.ucode     | Bin 0 -> 1711100 bytes
>  iwlwifi-so-a0-gf4-a0-79.ucode     | Bin 0 -> 1712776 bytes
>  iwlwifi-so-a0-gf4-a0.pnvm         | Bin 28252 -> 28252 bytes
>  iwlwifi-so-a0-hr-b0-79.ucode      | Bin 0 -> 1517148 bytes
>  iwlwifi-ty-a0-gf-a0-78.ucode      | Bin 0 -> 1620004 bytes
>  iwlwifi-ty-a0-gf-a0-79.ucode      | Bin 0 -> 1620704 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm          | Bin 41876 -> 41876 bytes
>  18 files changed, 29 insertions(+), 8 deletions(-)
>  create mode 100644 iwlwifi-so-a0-gf-a0-78.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0-78.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0-79.ucode
>  create mode 100644 iwlwifi-so-a0-hr-b0-79.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-78.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-79.ucode
