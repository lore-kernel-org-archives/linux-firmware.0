Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8B1C4332F
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Oct 2022 12:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64797C43143; Thu, 13 Oct 2022 12:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4BBC4347C
	for <linux-firmware@kernel.org>; Thu, 13 Oct 2022 12:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665664501;
	bh=61OxMAZGdQkFq5GuPSsz2ojCNhNi6qESe+fLgMuqwm8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=pmLkJQbCsBcMBURBqek273pkyi0csnHAf7RH1S4nfu+phxxOgOFlhKifzK7w1of6z
	 wAqzog8uG0ovHr77xQwOKb10DWBPwuYLixep/XDK88Dc/ObRDQSgBHDV+cV373auC1
	 emWnRjaLJL31sh+MmrosaHjZ4mmzxMRK4eXcc84h6dwZ8vVNcXTzMjvhntWW6pPVjx
	 tNxQbFP+f5bWIxR9BCOzgqF7j5HZtTr+K3s/g9RI85Koh/3vD/Hsddm1h6Alcm6nnB
	 8w0om8rEGsHYIqeO5R5fgsP1iHf3KUQ+9LBwVYX/9NFZcJF9ad7t+et9iQlfasepCE
	 DPSvvJykQNT2g==
Received: by mail-oi1-f173.google.com with SMTP id w74so1585063oie.0
        for <linux-firmware@kernel.org>; Thu, 13 Oct 2022 05:35:01 -0700 (PDT)
X-Gm-Message-State: ACrzQf1zbfR97xf6dqOJTPUAoIr3ddGFshRYW/o3B/fGDQKVj13gKLln
	IA7f3eql7WN2Nkgw6WLRSNgphH3u2SdzUTvJOqQ=
X-Google-Smtp-Source: AMsMyM5BJFMRW5iv4q6t4t5EwzvnMzUlYEAls+5g4NC4yjRmOG2KnCBxskyN8KB0aijmH6PulQ9QlwrlXQQaa2xGNqc=
X-Received: by 2002:a05:6808:1446:b0:354:f46b:8802 with SMTP id
 x6-20020a056808144600b00354f46b8802mr2903666oiv.267.1665664500275; Thu, 13
 Oct 2022 05:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <7da86974c74f441c083a77e1ddfa2f2bd15a7aac.camel@intel.com>
In-Reply-To: <7da86974c74f441c083a77e1ddfa2f2bd15a7aac.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 13 Oct 2022 08:34:49 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5FkJPwcX2xnkSLjuG1QWsyVk6xV-VN1FY6fEhtGbzD1w@mail.gmail.com>
Message-ID: <CA+5PVA5FkJPwcX2xnkSLjuG1QWsyVk6xV-VN1FY6fEhtGbzD1w@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2022-10-13
To: "Greenman, Gregory" <gregory.greenman@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"Hutchings, Ben" <ben@decadent.org.uk>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 13, 2022 at 7:09 AM Greenman, Gregory
<gregory.greenman@intel.com> wrote:
>
> Hi,
>
> This contains some new and updated firmwares for all our currently
> maintained FW binaries.
>
> Please pull or let me know if there are any issues.
>
> --
> Thanks,
> Gregory.
>
> The following changes since commit 8b07c1fb1d8de4259611a0cccaeda893d792cd91:
>
>   Merge branch 'a530-mbn' of https://github.com/lumag/linux-firmware (2022-10-12 13:07:39 -0400)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2022-13-10
>
> for you to fetch changes up to 98b55774bcc6c901cc985e8fab1404219a4ef196:
>
>   iwlwifi: add new FWs from core72-129 release (2022-10-13 13:15:03 +0300)
>
> ----------------------------------------------------------------
> iwlwifi: update 9000-family firmwares to core72-129 and
> iwlwifi: add new FWs from core72-129 release
>
> ----------------------------------------------------------------
> Gregory Greenman (2):
>       iwlwifi: update 9000-family firmwares to core72-129
>       iwlwifi: add new FWs from core72-129 release

Pulled and pushed out.  Thank you.

josh

>
>  WHENCE                            |  40 ++++++++++++++++++++++++++++++++++++++--
>  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1518788 -> 1518788 bytes
>  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1489548 -> 1489668 bytes
>  iwlwifi-Qu-b0-hr-b0-74.ucode      | Bin 0 -> 1371532 bytes
>  iwlwifi-Qu-b0-jf-b0-74.ucode      | Bin 0 -> 1290892 bytes
>  iwlwifi-Qu-c0-hr-b0-74.ucode      | Bin 0 -> 1371548 bytes
>  iwlwifi-Qu-c0-jf-b0-74.ucode      | Bin 0 -> 1290908 bytes
>  iwlwifi-QuZ-a0-hr-b0-74.ucode     | Bin 0 -> 1371668 bytes
>  iwlwifi-QuZ-a0-jf-b0-74.ucode     | Bin 0 -> 1290972 bytes
>  iwlwifi-cc-a0-74.ucode            | Bin 0 -> 1334780 bytes
>  iwlwifi-so-a0-gf-a0-74.ucode      | Bin 0 -> 1577460 bytes
>  iwlwifi-so-a0-gf-a0.pnvm          | Bin 41808 -> 41808 bytes
>  iwlwifi-so-a0-gf4-a0-74.ucode     | Bin 0 -> 1602068 bytes
>  iwlwifi-so-a0-gf4-a0.pnvm         | Bin 28064 -> 28064 bytes
>  iwlwifi-so-a0-hr-b0-74.ucode      | Bin 0 -> 1475876 bytes
>  iwlwifi-so-a0-jf-b0-74.ucode      | Bin 0 -> 1417940 bytes
>  iwlwifi-ty-a0-gf-a0-74.ucode      | Bin 0 -> 1533444 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm          | Bin 41588 -> 41588 bytes
>  18 files changed, 38 insertions(+), 2 deletions(-)
>  create mode 100644 iwlwifi-Qu-b0-hr-b0-74.ucode
>  create mode 100644 iwlwifi-Qu-b0-jf-b0-74.ucode
>  create mode 100644 iwlwifi-Qu-c0-hr-b0-74.ucode
>  create mode 100644 iwlwifi-Qu-c0-jf-b0-74.ucode
>  create mode 100644 iwlwifi-QuZ-a0-hr-b0-74.ucode
>  create mode 100644 iwlwifi-QuZ-a0-jf-b0-74.ucode
>  create mode 100644 iwlwifi-cc-a0-74.ucode
>  create mode 100644 iwlwifi-so-a0-gf-a0-74.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0-74.ucode
>  create mode 100644 iwlwifi-so-a0-hr-b0-74.ucode
>  create mode 100644 iwlwifi-so-a0-jf-b0-74.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-74.ucode
