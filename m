Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4B8C6FD1D
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Apr 2023 11:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A56AAC433A1; Tue,  4 Apr 2023 11:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901F0C4339E
	for <linux-firmware@kernel.org>; Tue,  4 Apr 2023 11:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680609595;
	bh=dSY42KeyU/OQ4VPUg+an2XDBW99spDr3BdAoJsZgnUs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=PT/raxpT8NBPi4xNLyoAsrJf9/cNN4fdm829fYfMroP94n7cKVxUWiHCDMFuwuIMo
	 1lwdLpaXmoGQLw3Bs1EMrBxIX0EGqxCEQxR4z0+i8xExvTzXtvuXoR5DXM+RIq/Fix
	 oIIxLOwqewib/LjnTP2BTZzQMFhaJVU3SG3hJoke0FM10Vk58i3dtY/+cJin26xitx
	 6cM8905C07cTEj233m0861tuTGnI4/ScZ8dQQVnrd59/xiqiGpJuj1aw8zSdxxMnAJ
	 oGhH/3M7BNZ1IcQZB63qnIIhMhbrh5kZeXBLZXXFbIWNe+a0CDsvUbwLhol7V7aGo/
	 JxQkURBvWndZw==
Received: by mail-yb1-f178.google.com with SMTP id k17so38296232ybm.11
        for <linux-firmware@kernel.org>; Tue, 04 Apr 2023 04:59:55 -0700 (PDT)
X-Gm-Message-State: AAQBX9fmRpUMlaw0821jbBCTyn70P2y3ubE03ufJnohC872rhg+zH3Sr
	WxMBsGRcmI8MTDOoeve3oeLs0JGoRoAGfEAdMPg=
X-Google-Smtp-Source: AKy350Z2tWVMAuhKzfOTSXbqlrho3hwa+G6SSCxwuN0EOm5RlrMPa0CFPwsFatHb29zsExdS6197KN0ul5fer/iR2xE=
X-Received: by 2002:a25:d2ce:0:b0:b77:ae4b:1b27 with SMTP id
 j197-20020a25d2ce000000b00b77ae4b1b27mr1423078ybg.8.1680609594568; Tue, 04
 Apr 2023 04:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <a64091100d99323501ee95b25436490346142c22.camel@intel.com>
In-Reply-To: <a64091100d99323501ee95b25436490346142c22.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 4 Apr 2023 07:59:43 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4fSAWw=c+KBKn8_FKCovo4tP1iWoJk6Och4s0=yt-7vQ@mail.gmail.com>
Message-ID: <CA+5PVA4fSAWw=c+KBKn8_FKCovo4tP1iWoJk6Och4s0=yt-7vQ@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2023-03-30
To: "Greenman, Gregory" <gregory.greenman@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"kyle@infradead.org" <kyle@infradead.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 4:14=E2=80=AFPM Greenman, Gregory
<gregory.greenman@intel.com> wrote:
>
> Hi,
>
> It contains some new firmwares for all our currently maintained FW binari=
es.
> Please pull or let me know if there are any issues.
>
> --
> Thanks,
> Gregory
>
>
> warning: redirecting to https://git.kernel.org/pub/scm/linux/kernel/git/i=
wlwifi/linux-firmware.git/
> The following changes since commit bcdcfbcf0a8f24a914b8c163906e6ce93d7f88=
97:
>
>   linux-firmware: Update firmware file for Intel Bluetooth AX101 (2023-03=
-20 08:34:27 -0400)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2023-03-30

Pulled and pushed out.

josh

>
> for you to fetch changes up to 78a8782a9e51e502a6ed267d270c6925fb738805:
>
>   iwlwifi: add new FWs from core78-32 release (2023-03-30 22:55:04 +0300)
>
> ----------------------------------------------------------------
> iwlwifi firmware update from core78-32 release.
>
> * update 9000-family firmwares:
> iwlwifi-9000-pu-b0-jf-b0-46.ucode
> iwlwifi-9260-th-b0-jf-b0-46.ucode
>
> * update -77.ucode and add -81.ucode firmwares
> iwlwifi-Qu-b0-hr-b0-77.ucode
> iwlwifi-Qu-b0-jf-b0-77.ucode
> iwlwifi-Qu-c0-hr-b0-77.ucode
> iwlwifi-Qu-c0-jf-b0-77.ucode
> iwlwifi-QuZ-a0-hr-b0-77.ucode
> iwlwifi-QuZ-a0-jf-b0-77.ucode
> iwlwifi-cc-a0-77.ucode
> iwlwifi-so-a0-gf-a0.pnvm
> iwlwifi-so-a0-gf4-a0.pnvm
> iwlwifi-so-a0-gf-a0-81.ucode
> iwlwifi-so-a0-gf4-a0-81.ucode
> iwlwifi-so-a0-hr-b0-81.ucode
> iwlwifi-ty-a0-gf-a0.pnvm
> iwlwifi-ty-a0-gf-a0-81.ucode
>
> ----------------------------------------------------------------
> Gregory Greenman (2):
>       iwlwifi: update 9000-family firmwares to core78-32
>       iwlwifi: add new FWs from core78-32 release
>
>  WHENCE                            |  30 +++++++++++++++++++++---------
>  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1518788 -> 1518772 bytes
>  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1489668 -> 1489652 bytes
>  iwlwifi-Qu-b0-hr-b0-77.ucode      | Bin 1404048 -> 1404676 bytes
>  iwlwifi-Qu-b0-jf-b0-77.ucode      | Bin 1321720 -> 1321900 bytes
>  iwlwifi-Qu-c0-hr-b0-77.ucode      | Bin 1404064 -> 1404692 bytes
>  iwlwifi-Qu-c0-jf-b0-77.ucode      | Bin 1321736 -> 1321916 bytes
>  iwlwifi-QuZ-a0-hr-b0-77.ucode     | Bin 1404184 -> 1404820 bytes
>  iwlwifi-QuZ-a0-jf-b0-77.ucode     | Bin 1325532 -> 1321956 bytes
>  iwlwifi-cc-a0-77.ucode            | Bin 1365484 -> 1366120 bytes
>  iwlwifi-so-a0-gf-a0-81.ucode      | Bin 0 -> 1682852 bytes
>  iwlwifi-so-a0-gf-a0.pnvm          | Bin 56048 -> 56048 bytes
>  iwlwifi-so-a0-gf4-a0-81.ucode     | Bin 0 -> 1691804 bytes
>  iwlwifi-so-a0-gf4-a0.pnvm         | Bin 28252 -> 28252 bytes
>  iwlwifi-so-a0-hr-b0-81.ucode      | Bin 0 -> 1539288 bytes
>  iwlwifi-ty-a0-gf-a0-81.ucode      | Bin 0 -> 1628828 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm          | Bin 41876 -> 41876 bytes
>  17 files changed, 21 insertions(+), 9 deletions(-)
>  create mode 100644 iwlwifi-so-a0-gf-a0-81.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0-81.ucode
>  create mode 100644 iwlwifi-so-a0-hr-b0-81.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-81.ucode
