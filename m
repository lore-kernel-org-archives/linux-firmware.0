Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F2AC636D4
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Feb 2023 19:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11C91C4339C; Fri, 10 Feb 2023 19:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAA6C433D2
	for <linux-firmware@kernel.org>; Fri, 10 Feb 2023 19:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676057762;
	bh=wzdN/HICrKFFJnsORvU5eQ+8Mpv5Tv4/0DgvPPr5D1o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=rz5xTgMKkUP+KgspKKBkCXC7DXtyaYO4hb9qi03DwB/LaqVLkkBPNKWOquW5Q5zK4
	 wpKCyOknUYdOxUIE77uHMTrH5Dy5BdTdSSbUrE5BP2QtttgjeCep28iwLfANG98Vy0
	 JJoYTvps5g/oR/xwgdYy1RPAgwE/l+2pGKlLiv0JDhZEL11Hhus1KHFimS31+gvpGo
	 kWSM118PncaxbmJHoH8EVbU2fiFCEqTftZwBEKUh1lyxUvtL5HFsZNBpjHrsiILNyV
	 a2ZLXB/so+OI4c+lK0lCzo5CpQ4ay2zcxuuhQFB3jYLFPx/TbFp58x3T4tlYEd0hH2
	 XtLf34WBqcJOw==
Received: by mail-yb1-f171.google.com with SMTP id q9so7647107ybk.2
        for <linux-firmware@kernel.org>; Fri, 10 Feb 2023 11:36:01 -0800 (PST)
X-Gm-Message-State: AO0yUKWIc6l7dPM/uxz2QZ3Pe3zES0nu1Kml5jO9mfRcGikMQwDz9egv
	fkt0nU+k2ri8Px+EBjI2uVvyD5lNGOornoa5BK0=
X-Google-Smtp-Source: AK7set+g5G4O5P9OGoN/nDf3rv3gz2PGgh7hvzzIJAxCiyssW4dIKxAgDPsHo8XdyC0b0SyY+ZQAURk7lgiCG3xulTM=
X-Received: by 2002:a25:e904:0:b0:8b9:9210:18e9 with SMTP id
 n4-20020a25e904000000b008b9921018e9mr1456123ybd.622.1676057761016; Fri, 10
 Feb 2023 11:36:01 -0800 (PST)
MIME-Version: 1.0
References: <95bf72c328de6450d8e0136317ea849830e4f67e.camel@realtek.com>
In-Reply-To: <95bf72c328de6450d8e0136317ea849830e4f67e.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 Feb 2023 14:35:50 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5EvPLg0qrrV1oY0yuqqMp-Go79NCvWkEsKNnhh=XUg0g@mail.gmail.com>
Message-ID: <CA+5PVA5EvPLg0qrrV1oY0yuqqMp-Go79NCvWkEsKNnhh=XUg0g@mail.gmail.com>
Subject: Re: pull request: rtw88: 8822c: Update normal firmware to v9.9.14
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Timlee <timlee@realtek.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 9, 2023 at 10:09 PM Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Hi,
>
> Update 8822c firmware of rtw88 driver to v9.9.14
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 5c11a3742947810ee8bffbd476eb5a1b0c7999f2:
>
>   amdgpu: Add VCN 4.0.2 firmware (2023-01-25 07:40:41 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD

Pulled and pushed out.

josh

>
> for you to fetch changes up to c3f3baada1ccc9b4c8f4bd838036110be6400ce5:
>
>   rtw88: 8822c: Update normal firmware to v9.9.14 (2023-02-10 11:02:21 +0800)
>
> ----------------------------------------------------------------
> Chin-Yen Lee (1):
>       rtw88: 8822c: Update normal firmware to v9.9.14
>
>  rtw88/rtw8822c_fw.bin | Bin 202552 -> 202552 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
>
