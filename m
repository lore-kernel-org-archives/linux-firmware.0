Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43B2C7EE25
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jun 2023 11:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D0FFC433EF; Mon, 12 Jun 2023 11:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E6CC433A7
	for <linux-firmware@kernel.org>; Mon, 12 Jun 2023 11:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686567780;
	bh=HexzEUWGjZOksX/929OqG0tR1U/D9QU0FVm7xRRQEHM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NoJUutqZjQSeYGvbo2FUzv3HXIuRLbiC2nyLUZFkstYEyOMHRWtlbhpxQS0fm3PQo
	 0Hnjds1gIjTpp3UB2HYgmyeGw12TarefhYdPb685VSZeMRez7YKm9ifDCFmke6gVM4
	 AeXoAPNl2MQ/NYIs9lYjvg9W5XDQUev8tO+U0ww3PWvGLBiyGx+G3r125RQNHdQtPU
	 PIlCmnnJuEnpP/wKvZdRO+pIMkn0hQbaw8FfOkq4oEs5177YCIArTGte/j996PWBtF
	 bKA9aEx57aNoefgwlDT9cyBttT1rfLV1nE9AVayBzLD4/LR/c6bo445GIHVV0EvW+6
	 aijGO2Z2guaww==
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-bc40d4145feso2447221276.1
        for <linux-firmware@kernel.org>; Mon, 12 Jun 2023 04:03:00 -0700 (PDT)
X-Gm-Message-State: AC+VfDwhpO5G/3oa0SqVsfntHgDtVxh/V/NmRLDqo3+7BQqom3iSrOeZ
	JhLsFXh7AnqWyy/TSEDkAWqZuUEiSCrE9FWm/SI=
X-Google-Smtp-Source: ACHHUZ4hMQsUm+BsLr4hDY0JOrSR1kv3KjSw+433c+7SxTAyU3+SNbLTdgOmS55Rhu0NyScJ9TY6kcc24Ox0rYYQYvQ=
X-Received: by 2002:a25:a349:0:b0:b9e:b9b4:bb12 with SMTP id
 d67-20020a25a349000000b00b9eb9b4bb12mr7644289ybi.48.1686567779509; Mon, 12
 Jun 2023 04:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230601073138.22227-1-chris.lu@mediatek.com>
In-Reply-To: <20230601073138.22227-1-chris.lu@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 12 Jun 2023 07:02:48 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5E2WiRrKy3=sF49tKW9ayvseTV5Wsv2Eh2oPEZm=iycA@mail.gmail.com>
Message-ID: <CA+5PVA5E2WiRrKy3=sF49tKW9ayvseTV5Wsv2Eh2oPEZm=iycA@mail.gmail.com>
Subject: Re: [PATCH 1/1] linux-firmware: update firmware for mediatek
 bluetooth chip (MT7922)
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

On Thu, Jun 1, 2023 at 3:31=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wro=
te:
>
> From: "Chris.Lu" <chris.lu@mediatek.com>
>
> Update binary firmware for MT7922 BT devices.
>
> File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
> Version: 20230530123531
>
> Signed-off-by: Chris.Lu <chris.lu@mediatek.com>
>
> Chris.Lu (1):
>   linux-firmware: update firmware for mediatek bluetooth chip (MT7922)
>
>  WHENCE                                  |   2 +-
>  mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin | Bin 511830 -> 509974 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

Applied and pushed out.

josh
