Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2B1C4332F
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Nov 2022 17:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 015DAC43144; Wed,  9 Nov 2022 17:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB6AC433B5
	for <linux-firmware@kernel.org>; Wed,  9 Nov 2022 17:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668016258;
	bh=ty/M8C2twXtgNA+1pWdVvGjmOnP1V8I5guHMoghkC1Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=IW4AZ43bg8tPPVazHEYSKaT5P0hehZv/d15mb6NLOR4eCZtWxq6UscF1biKMM1FLo
	 cQPEFtmeM/BOwTJv5FWSMRn7klJsINIt4vkEQJ/yAo9eSYLzEjfmWCETtJsT8tYbDt
	 e9L7b2sDIEmGreEYbxoWKCIqaL5O7t6smVVsxRWQBMkfhQB90/7rMndRbIEf0zusIL
	 41NCiuBf8PfbDgk/G4SospOmIwmyDELK2DqGaTWYkFfTk3N762PXFfUAW3xRMYu95q
	 wWjag0c/VLuudbbc7Fb8MoW0GG10Tk/OVYx+MmzZL21nxFRGNTRcSOKSt19uyhnCAh
	 XB9UAr/LYYbUw==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-13ae8117023so20433076fac.9
        for <linux-firmware@kernel.org>; Wed, 09 Nov 2022 09:50:58 -0800 (PST)
X-Gm-Message-State: ACrzQf0iD2L1zMs3QGrfLBiRK8qXzi3PdnPIBBNRwwbDZvNHzPUJ+Z0o
	bGFtAqvuACOSDaIzCfFU/TkfM3zDbFigEDutOyY=
X-Google-Smtp-Source: AMsMyM7OJHRs/W8HVKmdrWEDQupp23raLvAghTa7OsP96Ms/T4j7IVSzrEvTfGCCLTN7CyeLxuizykqrno5QlCxp+Vs=
X-Received: by 2002:a05:6871:723:b0:13b:f919:3146 with SMTP id
 f35-20020a056871072300b0013bf9193146mr37110937oap.267.1668016258051; Wed, 09
 Nov 2022 09:50:58 -0800 (PST)
MIME-Version: 1.0
References: <79b625f47ae9ed8fd9784471dff0deb5ecb2c2f1.camel@intel.com>
In-Reply-To: <79b625f47ae9ed8fd9784471dff0deb5ecb2c2f1.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Nov 2022 12:50:47 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5-C6qHVJF6pMuYyRL=TjcyoCp_y0ZPO2DpJLd7pXb7fQ@mail.gmail.com>
Message-ID: <CA+5PVA5-C6qHVJF6pMuYyRL=TjcyoCp_y0ZPO2DpJLd7pXb7fQ@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2022-11-08
To: "Greenman, Gregory" <gregory.greenman@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"kyle@infradead.org" <kyle@infradead.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Tue, Nov 8, 2022 at 12:35 PM Greenman, Gregory
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
> The following changes since commit 8bb75626e9dd831d323c4e460414b56260f0b700:
>
>   Merge branch 'for-upstream' of https://github.com/CirrusLogic/linux-firmware (2022-10-31 11:12:54 -0400)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2022-11-08
>
> for you to fetch changes up to 4a733c26d7a2ea93c06bfb793d6c878bc19a2c3c:
>
>   iwlwifi: add new FWs from core74_pv-60 release (2022-11-08 18:05:52 +0200)
>
> ----------------------------------------------------------------
> add new FWs from core74_pv-60 release
>
> ----------------------------------------------------------------
> Gregory Greenman (1):
>       iwlwifi: add new FWs from core74_pv-60 release
>
>  WHENCE                        |  36 ++++++++++++++++++++++++++++++++++++
>  iwlwifi-Qu-b0-hr-b0-77.ucode  | Bin 0 -> 1407736 bytes
>  iwlwifi-Qu-b0-jf-b0-77.ucode  | Bin 0 -> 1325500 bytes
>  iwlwifi-Qu-c0-hr-b0-77.ucode  | Bin 0 -> 1407752 bytes
>  iwlwifi-Qu-c0-jf-b0-77.ucode  | Bin 0 -> 1325516 bytes
>  iwlwifi-QuZ-a0-hr-b0-77.ucode | Bin 0 -> 1406756 bytes
>  iwlwifi-QuZ-a0-jf-b0-77.ucode | Bin 0 -> 1325532 bytes
>  iwlwifi-cc-a0-77.ucode        | Bin 0 -> 1369192 bytes
>  iwlwifi-so-a0-gf-a0-77.ucode  | Bin 0 -> 1641260 bytes
>  iwlwifi-so-a0-gf-a0.pnvm      | Bin 42092 -> 42092 bytes
>  iwlwifi-so-a0-gf4-a0-77.ucode | Bin 0 -> 1669164 bytes
>  iwlwifi-so-a0-gf4-a0.pnvm     | Bin 28064 -> 28252 bytes
>  iwlwifi-so-a0-hr-b0-77.ucode  | Bin 0 -> 1500532 bytes
>  iwlwifi-so-a0-jf-b0-77.ucode  | Bin 0 -> 1446036 bytes
>  iwlwifi-ty-a0-gf-a0-77.ucode  | Bin 0 -> 1594276 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm      | Bin 41876 -> 41876 bytes
>  16 files changed, 36 insertions(+)
>  create mode 100644 iwlwifi-Qu-b0-hr-b0-77.ucode
>  create mode 100644 iwlwifi-Qu-b0-jf-b0-77.ucode
>  create mode 100644 iwlwifi-Qu-c0-hr-b0-77.ucode
>  create mode 100644 iwlwifi-Qu-c0-jf-b0-77.ucode
>  create mode 100644 iwlwifi-QuZ-a0-hr-b0-77.ucode
>  create mode 100644 iwlwifi-QuZ-a0-jf-b0-77.ucode
>  create mode 100644 iwlwifi-cc-a0-77.ucode
>  create mode 100644 iwlwifi-so-a0-gf-a0-77.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0-77.ucode
>  create mode 100644 iwlwifi-so-a0-hr-b0-77.ucode
>  create mode 100644 iwlwifi-so-a0-jf-b0-77.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-77.ucode
