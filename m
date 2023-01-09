Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53358C54EBD
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Jan 2023 15:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1239FC4339B; Mon,  9 Jan 2023 15:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEB6C433F2
	for <linux-firmware@kernel.org>; Mon,  9 Jan 2023 15:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673278517;
	bh=TtW047ugLa/sfKcv3Mz/eo+41Ia/9arzRBJUDWDsdVw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=OEZsnV6mt8aMof7Ct5/ftkB6Jf2tCIILi/Ic3m3X7E70FJg74hyAA/jD9lR/rn6mP
	 ko4KAdDgV3oHZJ4WmGBIRokRwAEhmFS1xVUl84CsXqT8z1ZeKFjLohfF89MIzVKWsf
	 jQCu/PapKeeHmVUH017cI1dE9H7/UlQVwkrhtqc8xx+EHVogkmtpNrjD1qTwaKFkWm
	 Btcroyd94PKQHqaQI3NCJdN7wSyarqca4OuujWWrML6L7oJg8gKymWbDU4EOVK/QF5
	 Vb2nulSoQnfNsClJ2yRKQxoebCuRpCkXb4TILO8yenyD0yJwNJkJRg8pZDyUN5gkCr
	 C46DqCFNPcQtQ==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-4c7d35b37e2so61254617b3.2
        for <linux-firmware@kernel.org>; Mon, 09 Jan 2023 07:35:16 -0800 (PST)
X-Gm-Message-State: AFqh2koaSbL5KIsqQ21QNfTV9r6NapLcYCZBgj22lFZJrjB1+VgA8rli
	SxZWvgwbE6TEIE2iJrhVteDBiR29JAR7/O9cWxU=
X-Google-Smtp-Source: AMrXdXv99cso/HA2rtQvIOH9xBlRA6qyC2V/eZvDQ8E8V99apstaW1PHDzwE1xZSeJNsKearRPk91hE79flqp7LJY9M=
X-Received: by 2002:a0d:c2c1:0:b0:4ad:5c08:7e67 with SMTP id
 e184-20020a0dc2c1000000b004ad5c087e67mr3133586ywd.75.1673278515935; Mon, 09
 Jan 2023 07:35:15 -0800 (PST)
MIME-Version: 1.0
References: <60ea573bd4cd000d8576eb510492c55449461457.camel@intel.com>
In-Reply-To: <60ea573bd4cd000d8576eb510492c55449461457.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 9 Jan 2023 10:35:05 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7vUWsoDZEzuky+wekDaSvw-9Tg=nhi5VSqEeBEsjoO_A@mail.gmail.com>
Message-ID: <CA+5PVA7vUWsoDZEzuky+wekDaSvw-9Tg=nhi5VSqEeBEsjoO_A@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2023-01-09 - fixed version
To: "Greenman, Gregory" <gregory.greenman@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"kyle@infradead.org" <kyle@infradead.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 9, 2023 at 10:13 AM Greenman, Gregory
<gregory.greenman@intel.com> wrote:
>
> Hi,
>
> This is the fixed version of the pull request where I missed one firmware file.
>
> It contains some new firmwares for all our currently maintained FW binaries.
> Please pull or let me know if there are any issues.
>
>
> --
> Thanks,
> Gregory
>
> The following changes since commit 504b69117b0a6995230e0b7700ef8a3e78acfc57:
>
>   amdgpu: update renoir DMCUB firmware (2023-01-09 09:13:05 -0500)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2023-01-09

Thanks.  Pulled and pushed out.

josh

>
> for you to fetch changes up to c8ff1f4651a0a1a7b9720e9635a2b19aa2319df1:
>
>   iwlwifi: add new FWs from core76-35 release (2023-01-09 16:50:29 +0200)
>
> ----------------------------------------------------------------
> Firmware updates for iwlwifi:
>
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
>  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1518788 -> 1518788 bytes
>  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1489668 -> 1489668 bytes
>  iwlwifi-Qu-b0-hr-b0-77.ucode      | Bin 1407736 -> 1404048 bytes
>  iwlwifi-Qu-b0-jf-b0-77.ucode      | Bin 1325500 -> 1321720 bytes
>  iwlwifi-Qu-c0-hr-b0-77.ucode      | Bin 1407752 -> 1404064 bytes
>  iwlwifi-Qu-c0-jf-b0-77.ucode      | Bin 1325516 -> 1321736 bytes
>  iwlwifi-QuZ-a0-hr-b0-77.ucode     | Bin 1406756 -> 1404184 bytes
>  iwlwifi-cc-a0-77.ucode            | Bin 1369192 -> 1365484 bytes
>  iwlwifi-so-a0-gf-a0-78.ucode      | Bin 0 -> 1667236 bytes
>  iwlwifi-so-a0-gf-a0-79.ucode      | Bin 0 -> 1672988 bytes
>  iwlwifi-so-a0-gf-a0.pnvm          | Bin 42092 -> 56048 bytes
>  iwlwifi-so-a0-gf4-a0-78.ucode     | Bin 0 -> 1711100 bytes
>  iwlwifi-so-a0-gf4-a0-79.ucode     | Bin 0 -> 1712776 bytes
>  iwlwifi-so-a0-gf4-a0.pnvm         | Bin 28252 -> 28252 bytes
>  iwlwifi-so-a0-hr-b0-79.ucode      | Bin 0 -> 1517148 bytes
>  iwlwifi-ty-a0-gf-a0-78.ucode      | Bin 0 -> 1620004 bytes
>  iwlwifi-ty-a0-gf-a0-79.ucode      | Bin 0 -> 1620704 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm          | Bin 41876 -> 41876 bytes
>  19 files changed, 29 insertions(+), 8 deletions(-)
>  create mode 100644 iwlwifi-so-a0-gf-a0-78.ucode
>  create mode 100644 iwlwifi-so-a0-gf-a0-79.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0-78.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0-79.ucode
>  create mode 100644 iwlwifi-so-a0-hr-b0-79.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-78.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-79.ucode
