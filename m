Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC60FC6FD1D
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Apr 2023 11:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70AA5C4339C; Tue,  4 Apr 2023 11:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E91C433EF
	for <linux-firmware@kernel.org>; Tue,  4 Apr 2023 11:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680609429;
	bh=AY6J4kjFC8bArW6/oU97Z7hoVXnsvNznzXbUrItcXR4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=CDJpjvNtY9pO51cn5zOJ76TUBonXA9NztdLiST1DK7DikvkAMSxWVFk1zuUB/VV/w
	 /Q7uRQkVsgGM5PPILnooRfWZbSRSxPXpmXg4aO5qGYBPFASIkv+A+eRCRuTr3ftjCo
	 FQO/wFgLQXaugy2EJnxgIVaANlRdXzXbtHcy1X5alGoq8wJ2naQlkr/LIK4tUXvf9q
	 vOP1P7MRgQgtxcosVrjDaUQBgO/Oxhzk9HOwUSQgxcPDpiIc6eIZKhTLyV7qZiB/EQ
	 e8Kw3bnCDUJAd6PHnUs5fxeeD10XJFAzQrozRDOfNXclJ78Ux9dddY7d9OUhYb2TN6
	 rEAC6D3P/Xq9Q==
Received: by mail-yb1-f180.google.com with SMTP id m16so17989680ybk.0
        for <linux-firmware@kernel.org>; Tue, 04 Apr 2023 04:57:09 -0700 (PDT)
X-Gm-Message-State: AAQBX9dHPNLokxtb8A1JY36FSOM7jGjPpomdwT+IPCtVLTumKasXc2+D
	kz8ICNwy5gZ+WsB14fiClk4Yk/ekaM6n+RFZG14=
X-Google-Smtp-Source: AKy350an+TYV1l50QxQV0wdt09K7pljoq9SWWX5oKuXLjlGeX8T1PTyYdYNjvRvi/ZBRWs7pK+NHt2ovzavdkAaiCGE=
X-Received: by 2002:a25:77cd:0:b0:b7d:e643:d3c3 with SMTP id
 s196-20020a2577cd000000b00b7de643d3c3mr1678305ybc.8.1680609428377; Tue, 04
 Apr 2023 04:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <b02dace035e2b58686f8c7f449be6be3f32a6485.camel@realtek.com>
In-Reply-To: <b02dace035e2b58686f8c7f449be6be3f32a6485.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 4 Apr 2023 07:56:57 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5QncR1AsUxbhuMC+Nw+U2sZS=KOtRG7D4=wW0A8TZO5g@mail.gmail.com>
Message-ID: <CA+5PVA5QncR1AsUxbhuMC+Nw+U2sZS=KOtRG7D4=wW0A8TZO5g@mail.gmail.com>
Subject: Re: pull request: rtw88: 8822c: Update normal firmware to v9.9.15
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Bernie Huang <phhuang@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 7:31=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Hi,
>
> Update 8822c firmware of rtw88 driver to v9.9.15
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit bcdcfbcf0a8f24a914b8c163906e6ce93d7f88=
97:
>
>   linux-firmware: Update firmware file for Intel Bluetooth AX101 (2023-03=
-20 08:34:27 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD

Pulled and pushed out.

josh

>
> for you to fetch changes up to e40a5b63243dbc0a77543d3975658fd668ef2586:
>
>   rtw88: 8822c: Update normal firmware to v9.9.15 (2023-03-24 19:26:57 +0=
800)
>
> ----------------------------------------------------------------
> Po-Hao Huang (1):
>       rtw88: 8822c: Update normal firmware to v9.9.15
>
>  rtw88/rtw8822c_fw.bin | Bin 202552 -> 202600 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
