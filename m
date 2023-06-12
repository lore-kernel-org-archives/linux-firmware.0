Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDE4C7EE43
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jun 2023 11:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 550B2C433A8; Mon, 12 Jun 2023 11:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F538C4339E
	for <linux-firmware@kernel.org>; Mon, 12 Jun 2023 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686567806;
	bh=S8sC/gdjNjDsDtN44GibRUdS4P3hBFLv+xv06K0+bgw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=QGvpQPAO+N7YvwiitsGwLMvuz+l7KJY/4Y/srGalCyGA2Q2UqGvlyuJEmGBIna67T
	 wWPxO/n1Vb0uwtq0OXAm6Ulx6mtyLiETAZ9yRufNxUCFmRVVLVKQ4t/OXcZOuNyXXD
	 RG9D38W8Wj0StwN16QA52EtgBPUzSWM7RaGAgOKiL1HiKrVI7m5nvbHQXX9zaDIvHX
	 kvxu+8/AE0gGFtQogJw/sQGlkR40/8Iqt/y4Ac11Iyzsa8fncALY5fOD99FNSvZ7AX
	 TzRGSCyZSeatPelE4ounBFInTW66+5RY3qN1iCxLEC36Kc+UQl1SJ0njH3PwFUn1uM
	 /GcOisB4bhalg==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-56cf34a3c72so21875877b3.1
        for <linux-firmware@kernel.org>; Mon, 12 Jun 2023 04:03:26 -0700 (PDT)
X-Gm-Message-State: AC+VfDyywszoR5lF+XP/qMuwCCK6iZk5ei9GvvygC+Oqodpx6e+5Oud0
	l6wx2ZHzjkjZqihoBcrK3BDdcIALZIGyMxyYBRM=
X-Google-Smtp-Source: ACHHUZ6x/r6ceWurQ4RcnSkP/r5CePBGm/J85Ly39bmGOSRTEXzT/LMwUdLCKx0zUso4t5r9ugfrbduPLkmGeYjrpOo=
X-Received: by 2002:a81:bf41:0:b0:569:5f4f:b316 with SMTP id
 s1-20020a81bf41000000b005695f4fb316mr9299436ywk.13.1686567805069; Mon, 12 Jun
 2023 04:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230601073315.22308-1-chris.lu@mediatek.com>
In-Reply-To: <20230601073315.22308-1-chris.lu@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 12 Jun 2023 07:03:14 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5x5peYNQd3gQ4Bz5G_5OFXS-hnfb8Kxo=KqECOmf0O2w@mail.gmail.com>
Message-ID: <CA+5PVA5x5peYNQd3gQ4Bz5G_5OFXS-hnfb8Kxo=KqECOmf0O2w@mail.gmail.com>
Subject: Re: [PATCH 1/1] linux-firmware: update firmware for mediatek
 bluetooth chip (MT7921)
To: Chris Lu <chris.lu@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Ben Hutchings <ben@decadent.org.uk>, 
	Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>, 
	Aaron Hou <aaron.hou@mediatek.com>, KM Lin <km.lin@mediatek.com>, 
	Robin Chiu <robin.chiu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-firmware <linux-firmware@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 3:33=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wro=
te:
>
> From: "Chris.Lu" <chris.lu@mediatek.com>
>
> Update binary firmware for MT7921 BT devices.
>
> File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
> Version: 20230526131214
>
> Signed-off-by: Chris.Lu <chris.lu@mediatek.com>
>
> Chris.Lu (1):
>   linux-firmware: update firmware for mediatek bluetooth chip (MT7921)
>
>  WHENCE                                  |   2 +-
>  mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin | Bin 532590 -> 532846 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

Applied and pushed out.

josh
