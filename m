Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3331C433F5
	for <linux-firmware@archiver.kernel.org>; Thu, 24 Feb 2022 20:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B817C340F6; Thu, 24 Feb 2022 20:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F40C340EF
	for <linux-firmware@kernel.org>; Thu, 24 Feb 2022 20:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645734016;
	bh=Sb5PnffgEyE8tNmtHk0zKaVtcMek5aLE64+seXgzdLQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Olh0wOusMfC35r3km/RwCku9fDWzbSmQKlkoSyYEUGxvcN4AOZqZStLJIh4NGou07
	 a9duAAdOJ3Y3RnevVHnvegLHE6NdD4VK1iR5pXVY5e7HDFuponR7Kq/PM/WzSp2wmW
	 j+DQqjVi1Z943QNwt15dP+BFVue0hpNtAGTdSH+Xqx6iKYy/Et9+wAaa5nTmWIukop
	 xMDn1FbVbb8Wv9qQXAnYv0GcStVEsQWV8LjIK1nvsiBhWhuPfCmRqAa+o0U4lBUd/W
	 UVoOldFhSjSK963J883RE0nqnz2aPDXMvHUHWdvCffW7hqK3pGzuhLmyStgTPvHQrS
	 SnAgyufeaJphw==
Received: by mail-io1-f41.google.com with SMTP id r7so4164941iot.3
        for <linux-firmware@kernel.org>; Thu, 24 Feb 2022 12:20:16 -0800 (PST)
X-Gm-Message-State: AOAM53300YqEbzvEdKdRQ7bXi3iWFaE1nA9L3cKUmz5tIS8RhtIEKk+7
	GQ7px3hLGI1W/gMve6IanmkzAfjy+Jw3S3v4dFU=
X-Google-Smtp-Source: ABdhPJxEO4XQqOdYX0gmAA7mFOvK688/piUblsSicZ4wTfUU0hHTXbn7Mn0FrKvb7DBWeUidraLj8Wnt4jzapeRCTlI=
X-Received: by 2002:a02:cc16:0:b0:30d:289a:f7d7 with SMTP id
 n22-20020a02cc16000000b0030d289af7d7mr3302224jap.144.1645734015698; Thu, 24
 Feb 2022 12:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20220221163754.150011-1-Jerome.Pouiller@silabs.com>
In-Reply-To: <20220221163754.150011-1-Jerome.Pouiller@silabs.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 24 Feb 2022 15:20:04 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4yMABHrNoP+wNnPhTDhftDcXVNDZgfhGuQx+eUudVzTw@mail.gmail.com>
Message-ID: <CA+5PVA4yMABHrNoP+wNnPhTDhftDcXVNDZgfhGuQx+eUudVzTw@mail.gmail.com>
Subject: Re: [PATCH 0/3] linux-firmware: update wfx
To: Jerome Pouiller <Jerome.Pouiller@silabs.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Wireless <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@codeaurora.org>, 
	Linux Firmware <linux-firmware@kernel.org>, devel@driverdev.osuosl.org, 
	netdev <netdev@vger.kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jerome.pouiller@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 11:38 AM Jerome Pouiller
<Jerome.Pouiller@silabs.com> wrote:
>
> From: J=C3=A9r=C3=B4me Pouiller <jerome.pouiller@silabs.com>
>
> The two first patches reflect changes made in the kernel.
>
> J=C3=A9r=C3=B4me Pouiller (3):
>   wfx: rename silabs/ into wfx/
>   wfx: add antenna configuration files
>   wfx: update to firmware 3.14

All 3 applied and pushed out.

josh

>
>  WHENCE                        |  18 ++++++++++++++----
>  silabs/wfm_wf200_C0.sec       | Bin 305232 -> 0 bytes
>  {silabs =3D> wfx}/LICENCE.wf200 |   0
>  wfx/brd4001a.pds              | Bin 0 -> 625 bytes
>  wfx/brd8022a.pds              | Bin 0 -> 584 bytes
>  wfx/brd8023a.pds              | Bin 0 -> 625 bytes
>  wfx/wfm_wf200_C0.sec          | Bin 0 -> 309328 bytes
>  7 files changed, 14 insertions(+), 4 deletions(-)
>  delete mode 100644 silabs/wfm_wf200_C0.sec
>  rename {silabs =3D> wfx}/LICENCE.wf200 (100%)
>  create mode 100644 wfx/brd4001a.pds
>  create mode 100644 wfx/brd8022a.pds
>  create mode 100644 wfx/brd8023a.pds
>  create mode 100644 wfx/wfm_wf200_C0.sec
>
> --
> 2.34.1
>
