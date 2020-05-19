Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF85C433DF
	for <linux-firmware@archiver.kernel.org>; Tue, 19 May 2020 11:29:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7D6DA207ED; Tue, 19 May 2020 11:29:38 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5A3D920758
	for <linux-firmware@kernel.org>; Tue, 19 May 2020 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589887778;
	bh=0opTcUFe2aqAFIPfUn19Y0zUkyJ84dcaBdakCGO2/Z4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=0Pl5KJ8NkSRQuytGpoBa7OoGn7iQ7SGdyLeN6aZJBwFaO1t3Oe3gNY74z+CtEfGcC
	 9aiR5AZExO5RbGoM8y+iisRA0YBK4RughZ8GNYAGjdlmLwSbI1VxsFgwUAhP0KdktF
	 33BYdptp5yMDWpfklQX3MPWK5C4Glz8HR6+hMqvU=
Received: by mail-il1-f177.google.com with SMTP id j3so12994582ilk.11
        for <linux-firmware@kernel.org>; Tue, 19 May 2020 04:29:38 -0700 (PDT)
X-Gm-Message-State: AOAM532XgVjBQ/xhzVRAfnTmuAHXcXieav8y6Q+GXR5/KIgRPBP1EJfI
	ZCPkvc3h2v4EWNz5ud//8mqKd7i1fONDymtZUac=
X-Google-Smtp-Source: ABdhPJxZABiXkp+ahBUBbX4rBDUX/iW37u+6C+V01I4IvcdrbtyWjH3LrA/eI/Z+koHX3BsYPDjjTklrPVXEXlSBjZQ=
X-Received: by 2002:a92:5a5d:: with SMTP id o90mr20979512ilb.206.1589887777739;
 Tue, 19 May 2020 04:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <77eee10bfa6a63c34085aae12be28943146190a2.camel@coelho.fi>
In-Reply-To: <77eee10bfa6a63c34085aae12be28943146190a2.camel@coelho.fi>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 19 May 2020 07:29:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7qtdLVW2Kq85RyF8b-7oD4aFwv2ef4xpREexkx4V+khA@mail.gmail.com>
Message-ID: <CA+5PVA7qtdLVW2Kq85RyF8b-7oD4aFwv2ef4xpREexkx4V+khA@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2020-05-19
To: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, linuxwifi <linuxwifi@intel.com>, 
	"kyle@infradead.org" <kyle@infradead.org>, "ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.  Thanks!

josh

On Tue, May 19, 2020 at 3:40 AM Luca Coelho <luca@coelho.fi> wrote:
>
> Hi,
>
> This contains some new and updated firmwares for all our currently
> maintained FW binaries.
>
> Please pull or let me know if there are any issues.
>
> --
> Cheers,
> Luca.
>
>
> The following changes since commit f8d32e4cc99bcd985dd64892392c42b52c941369:
>
>   rtw88: update firmware information and README (2020-05-17 14:50:01 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2020-05-19
>
> for you to fetch changes up to 5ee1c7d65c26b90b796362ac1b5715435e2a1384:
>
>   iwlwifi: update and add new FWs from core50-70 and core52-81 releases (2020-05-19 09:36:28 +0300)
>
> ----------------------------------------------------------------
> Update iwlwifi firmwares to Core50-70 and Core52-81
>
> ----------------------------------------------------------------
> Luca Coelho (3):
>       iwlwifi: update 8265 FW
>       iwlwifi: update FWs to core47-142 release
>       iwlwifi: update and add new FWs from core50-70 and core52-81 releases
>
>  WHENCE                            |  75 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
>  iwlwifi-3168-29.ucode             | Bin 1036300 -> 1036288 bytes
>  iwlwifi-7265D-29.ucode            | Bin 1036668 -> 1036656 bytes
>  iwlwifi-8000C-36.ucode            | Bin 2401356 -> 2401100 bytes
>  iwlwifi-8265-36.ucode             | Bin 2414592 -> 2409984 bytes
>  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1462068 -> 1481104 bytes
>  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1463820 -> 1470272 bytes
>  iwlwifi-Qu-b0-hr-b0-50.ucode      | Bin 0 -> 1103952 bytes
>  iwlwifi-Qu-b0-hr-b0-53.ucode      | Bin 0 -> 1209628 bytes
>  iwlwifi-Qu-b0-hr-b0-55.ucode      | Bin 0 -> 1223144 bytes
>  iwlwifi-Qu-b0-jf-b0-50.ucode      | Bin 0 -> 1053004 bytes
>  iwlwifi-Qu-b0-jf-b0-53.ucode      | Bin 0 -> 1147104 bytes
>  iwlwifi-Qu-b0-jf-b0-55.ucode      | Bin 0 -> 1163672 bytes
>  iwlwifi-Qu-c0-hr-b0-50.ucode      | Bin 0 -> 1103968 bytes
>  iwlwifi-Qu-c0-hr-b0-53.ucode      | Bin 0 -> 1209644 bytes
>  iwlwifi-Qu-c0-hr-b0-55.ucode      | Bin 0 -> 1223160 bytes
>  iwlwifi-Qu-c0-jf-b0-50.ucode      | Bin 0 -> 1053020 bytes
>  iwlwifi-Qu-c0-jf-b0-53.ucode      | Bin 0 -> 1147120 bytes
>  iwlwifi-Qu-c0-jf-b0-55.ucode      | Bin 0 -> 1163688 bytes
>  iwlwifi-QuZ-a0-hr-b0-50.ucode     | Bin 0 -> 1103952 bytes
>  iwlwifi-QuZ-a0-hr-b0-53.ucode     | Bin 0 -> 1209628 bytes
>  iwlwifi-QuZ-a0-hr-b0-55.ucode     | Bin 0 -> 1223140 bytes
>  iwlwifi-QuZ-a0-jf-b0-50.ucode     | Bin 0 -> 1053004 bytes
>  iwlwifi-QuZ-a0-jf-b0-53.ucode     | Bin 0 -> 1147104 bytes
>  iwlwifi-QuZ-a0-jf-b0-55.ucode     | Bin 0 -> 1163668 bytes
>  iwlwifi-cc-a0-50.ucode            | Bin 0 -> 1101228 bytes
>  iwlwifi-cc-a0-53.ucode            | Bin 0 -> 1205332 bytes
>  iwlwifi-cc-a0-55.ucode            | Bin 0 -> 1219356 bytes
>  28 files changed, 69 insertions(+), 6 deletions(-)
>  create mode 100644 iwlwifi-Qu-b0-hr-b0-50.ucode
>  create mode 100644 iwlwifi-Qu-b0-hr-b0-53.ucode
>  create mode 100644 iwlwifi-Qu-b0-hr-b0-55.ucode
>  create mode 100644 iwlwifi-Qu-b0-jf-b0-50.ucode
>  create mode 100644 iwlwifi-Qu-b0-jf-b0-53.ucode
>  create mode 100644 iwlwifi-Qu-b0-jf-b0-55.ucode
>  create mode 100644 iwlwifi-Qu-c0-hr-b0-50.ucode
>  create mode 100644 iwlwifi-Qu-c0-hr-b0-53.ucode
>  create mode 100644 iwlwifi-Qu-c0-hr-b0-55.ucode
>  create mode 100644 iwlwifi-Qu-c0-jf-b0-50.ucode
>  create mode 100644 iwlwifi-Qu-c0-jf-b0-53.ucode
>  create mode 100644 iwlwifi-Qu-c0-jf-b0-55.ucode
>  create mode 100644 iwlwifi-QuZ-a0-hr-b0-50.ucode
>  create mode 100644 iwlwifi-QuZ-a0-hr-b0-53.ucode
>  create mode 100644 iwlwifi-QuZ-a0-hr-b0-55.ucode
>  create mode 100644 iwlwifi-QuZ-a0-jf-b0-50.ucode
>  create mode 100644 iwlwifi-QuZ-a0-jf-b0-53.ucode
>  create mode 100644 iwlwifi-QuZ-a0-jf-b0-55.ucode
>  create mode 100644 iwlwifi-cc-a0-50.ucode
>  create mode 100644 iwlwifi-cc-a0-53.ucode
>  create mode 100644 iwlwifi-cc-a0-55.ucode
