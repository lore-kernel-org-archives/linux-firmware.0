Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77B9C83F17
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Jul 2025 23:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75BB6C4CEF1; Tue, 15 Jul 2025 23:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600F4C4CEF7
	for <linux-firmware@kernel.org>; Tue, 15 Jul 2025 23:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752622178;
	bh=KCefVLyeHt67wusi/u+A5bCJDM0bRI+Sue4ywQXllzM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=G0qLr8q1OgCU39qe3pwOudKktsTUTrDIZ6KyBBZoaGZ+dhEDlqbTW+xqQnFqug6Q3
	 n/ftFNIl8SMqgT82T0/jKp7Fwrfif6SDjl1sr+3GIXWLYFBuOWiSnXAzS7RREDYkB3
	 A6KBAwIaSEx0XxncCAYDaYzVEuvNgUjLDE8+Amt8qKzsJIBtZGWEqzq4LgjBg4UhRk
	 7bzKkErPxsfRoSrdtcWmbgCAWSweMkqKQyQV9D3qiVRUK56q+IBVMW8NY3Uwg/19Qg
	 y8Lfo7vG9uUKa+rFbrTljEGJ4aZd3sh3/1q891tiLdH1VScNzbJb0GI23p3iRut2uG
	 mazwxNUiV3AVA==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-710fd2d0372so3250277b3.0
        for <linux-firmware@kernel.org>; Tue, 15 Jul 2025 16:29:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YyBWWmZAeKIjDrhnnazxyvKgxLhSeQ2nmeNkSFJXRTAiKxx+NZV
	26m9M5UWXP1KZDGsMiouLO414r+NEGoOu1Hx/fskUgRvwR84bCRKIJhTBPvwDoYVVQ5Egn387aG
	jP34yiFr6Dpgyd9uwu9Bnj8V6PTCm1Uk=
X-Google-Smtp-Source: AGHT+IEJu/eBBAD3iifWrQWBSgjRMLvDefwtQwh5jkKvlvitkBGQHk6rycQbT3hypyz1bc5KJ48TJ8i7qq1zwG1U714=
X-Received: by 2002:a05:690c:9a87:b0:713:fed3:70a5 with SMTP id
 00721157ae682-71835031badmr15649077b3.9.1752622177581; Tue, 15 Jul 2025
 16:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <880417d5-c1ae-4423-9019-e3dcc2673c43@RTEXMBS04.realtek.com.tw>
In-Reply-To: <880417d5-c1ae-4423-9019-e3dcc2673c43@RTEXMBS04.realtek.com.tw>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 15 Jul 2025 19:29:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4LGpLH281XmCEFE1qiOmz=-BzeJkGzABCgrpW91JOR0w@mail.gmail.com>
X-Gm-Features: Ac12FXwrckbRQyejK9MbaPclOdLeZP6m2RttV1MSObnqzZMpp133MYQpGVFZTEY
Message-ID: <CA+5PVA4LGpLH281XmCEFE1qiOmz=-BzeJkGzABCgrpW91JOR0w@mail.gmail.com>
Subject: Re: pull-request: update rtw firmware rtw-fw-2025-07-15
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	kevin_yang@realtek.com, damon.chen@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/615

josh

On Tue, Jul 15, 2025 at 1:53=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Hi,
>
> Update firmware of Realtek WiFi driver rtw89 to update BB and regd
> parameters, and to support MCC P2P feature.
>
> Thank you
> Ping-Ke
>
> ---
>
> The following changes since commit ecdbd2b8af04b515732fbf11113cec16651915=
f0:
>
>   Merge branch 'robot/pr-0-1752505495' into 'main' (2025-07-14 15:45:59 +=
0000)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2025-07-15
>
> for you to fetch changes up to eb03c8ce595d75f2a2f81cbe87698c2539f64377:
>
>   rtw89: 8852b: update fw to v0.29.128.0 (2025-07-15 13:49:01 +0800)
>
> ----------------------------------------------------------------
> Kuan-Chung Chen (1):
>       rtw89: 8922a: update BB parameter V49
>
> Zong-Zhe Yang (4):
>       rtw89: 8852c: add regd fw element with version R72-R57
>       rtw89: 8922a: add regd fw element with version R72-R6
>       rtw89: 8852bt: update fw to v0.29.127.0
>       rtw89: 8852b: update fw to v0.29.128.0
>
>  rtw89/rtw8852b_fw-1.bin | Bin 1244784 -> 1290952 bytes
>  rtw89/rtw8852bt_fw.bin  | Bin 918376 -> 937688 bytes
>  rtw89/rtw8852c_fw-2.bin | Bin 2461176 -> 2463394 bytes
>  rtw89/rtw8922a_fw-4.bin | Bin 1259006 -> 1263938 bytes
>  4 files changed, 0 insertions(+), 0 deletions(-)
