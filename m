Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C78FC433F5
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Nov 2021 17:26:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F35AD60F6F; Tue, 23 Nov 2021 17:26:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD6C760F6B
	for <linux-firmware@kernel.org>; Tue, 23 Nov 2021 17:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637688379;
	bh=+eXdvDlGRi4+cPViSYcoqa2i2CXtnKAxh1JnBg86qDo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=rpyIp+1Kv13kYY9vTGL7/+HXtCnnCxw7CVqQN7ltUk6QSePzB9+6W2uLx6Hitk7gn
	 jjAfkqzCeS/OmeAcS8qiw3dmePkJJ3Yb9mx5yVjla7wMZeFCXQPIOMPvme6KHWT/Zm
	 HpIULNnDzpYhAcwg3ni+HPBde3UYXASLnIrAUfBN3P9mqpLTPUTBebGUEYlURookIF
	 Ir8IMPP4XrU7M8O1INqxT4rVB5QbUnHEpFXtItQ1xNFGwCbfulioCTVECgabwsLy2j
	 UOfW86eAtkMr2nwRG2rozDK4+3+JqwLRb16t0RmqTLI7I5TTQVXv5BgoIwW4a4+BEE
	 DCWcr2pRscxoQ==
Received: by mail-il1-f170.google.com with SMTP id w4so11327063ilv.12
        for <linux-firmware@kernel.org>; Tue, 23 Nov 2021 09:26:19 -0800 (PST)
X-Gm-Message-State: AOAM530p+Sg+Y7pp9eslpTgCthZ6dtHvcMcmMondYLsUp3E7qkM7QeAF
	96n4DG+9dkbvQyaWv63Cb59snvnyxy0/lTuS24c=
X-Google-Smtp-Source: ABdhPJw0KFy6SdLPHX04KDy4m1j/bs4AjSHYlm81azhpg1157dCdtRQ3hGmvl888DwIwisHiw9MpG7loG7Hhj89rJhc=
X-Received: by 2002:a92:cda2:: with SMTP id g2mr6710422ild.2.1637688379281;
 Tue, 23 Nov 2021 09:26:19 -0800 (PST)
MIME-Version: 1.0
References: <SJ0PR18MB4009A38C84F0529CFA8B8FD3B29B9@SJ0PR18MB4009.namprd18.prod.outlook.com>
In-Reply-To: <SJ0PR18MB4009A38C84F0529CFA8B8FD3B29B9@SJ0PR18MB4009.namprd18.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 23 Nov 2021 12:26:08 -0500
X-Gmail-Original-Message-ID: <CA+5PVA75Xk==5o-PXahCTN=+rBgG595UO-nQ-bfhUQE3sBzXYg@mail.gmail.com>
Message-ID: <CA+5PVA75Xk==5o-PXahCTN=+rBgG595UO-nQ-bfhUQE3sBzXYg@mail.gmail.com>
Subject: Re: [GIT PULL v2] linux-firmware: mrvl: prestera: Update Marvell
 Prestera Switchdev v4.0
To: "Volodymyr Mytnyk [C]" <vmytnyk@marvell.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Oleksandr Mazur <oleksandr.mazur@plvision.eu>, Serhiy Boiko <serhiy.boiko@plvision.eu>, 
	Serhiy Pshyk <serhiy.pshyk@plvision.eu>, Volodymyr Mytnyk <volodymyr.mytnyk@plvision.eu>, 
	Taras Chornyi <taras.chornyi@plvision.eu>, Mickey Rachamim <mickeyr@marvell.com>, 
	Vadym Kochan <vadym.kochan@plvision.eu>, Yevhen Orlov <yevhen.orlov@plvision.eu>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 18, 2021 at 10:41 AM Volodymyr Mytnyk [C]
<vmytnyk@marvell.com> wrote:
>
> The following changes since commit f5d519563ac9d2d1f382a817aae5ec5473811ac8:
>
>   linux-firmware: Update AMD cpu microcode (2021-11-15 12:49:19 -0500)
>
> are available in the git repository at:
>
>   https://github.com/PLVision/linux-firmware.git prestera-v4.0
>
> for you to fetch changes up to 77e72100290150317c3a29baddf97f8fd27b58b4:
>
>   mrvl: prestera: Update Marvell Prestera Switchdev v4.0 (2021-11-18 17:05:16 +0200)
>
> ----------------------------------------------------------------
> Changes in V2:
>   - Add entry into WHENCE
>
> Volodymyr Mytnyk (1):
>       mrvl: prestera: Update Marvell Prestera Switchdev v4.0

Pulled and pushed out.

josh

>
>  WHENCE                                  |   1 +
>  mrvl/prestera/mvsw_prestera_fw-v4.0.img | Bin 0 -> 14965408 bytes
>  2 files changed, 1 insertion(+)
>  create mode 100644 mrvl/prestera/mvsw_prestera_fw-v4.0.img
