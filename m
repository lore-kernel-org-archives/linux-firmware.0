Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04C7ECAAD5
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Sep 2022 12:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A610FC433D7; Mon, 12 Sep 2022 12:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907B8C433B5
	for <linux-firmware@kernel.org>; Mon, 12 Sep 2022 12:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662985241;
	bh=ZOcpTOhI/vGinTgCDUwd/OnzOiboKq2XCw1TykR3lTU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=H9/YOPE8NGV3eegZFX4Y2QI5Y2V2gLVKWkqJvri5FUgRT/0vl7A0AfkVYHvBQBZX0
	 fcFAQshiCczqGXlpYypmmoyxryWJRPM1gT1mX36WJHErvc11ODIQ7537VBeOJxf8s7
	 BPKroVa2Ced+iJ2O7xLG0d0YVL6mZ5huIuI05W6GqwQGpRroSuqEDRiJwrxYscW0vN
	 PU9+5K5SndMJQ+pSUF9U+odKwT6qsgp4JFUpe6iXKl5tDJRJpTuGkNRmfNtBZ2maY6
	 UEEuUu7iYa74qDYfLRW6kV/qPxamoY+FVzKaPRIVTnEX9xWqI+0uYzW1ogrBcBl6uh
	 +l+XSc5xPuVeg==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1274ec87ad5so22925514fac.0
        for <linux-firmware@kernel.org>; Mon, 12 Sep 2022 05:20:41 -0700 (PDT)
X-Gm-Message-State: ACgBeo3ut2gH8aTYXclWfyW7h73leQj/GMXIlrbTjkD/ygZj23NdqY+J
	mi7vQat2JS1tDeEbnlxKqdrfMW7LlvDKJm6D4mA=
X-Google-Smtp-Source: AA6agR7gb/v4/ZkZm3Izur0IOuWlYeJ2BqlreUeNu84KPbYRqBch3VO637SrtHSChPqWX3g+wibOu3Kn4S88pVznofE=
X-Received: by 2002:aca:4144:0:b0:345:7285:1141 with SMTP id
 o65-20020aca4144000000b0034572851141mr9275343oia.267.1662985240757; Mon, 12
 Sep 2022 05:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <89617ae198a44036a8d4a9df1cac116f@realtek.com>
In-Reply-To: <89617ae198a44036a8d4a9df1cac116f@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 12 Sep 2022 08:20:30 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7WvvMWHy4HZoiD=PR7wBBCHTbfJ0x4oyjAS4dEx9kVJg@mail.gmail.com>
Message-ID: <CA+5PVA7WvvMWHy4HZoiD=PR7wBBCHTbfJ0x4oyjAS4dEx9kVJg@mail.gmail.com>
Subject: Re: pull request: rtw89: 8852c: update fw to v0.27.42.0
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Bernie Huang <phhuang@realtek.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 8, 2022 at 1:41 AM Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Hi,
>
> Update 8852c firmware of rtw89 driver to v0.27.42.0
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 9ebd5a558b7cd73182344b42ba88b75520446407:
>
>   rtw89: 8852c: update fw to v0.27.42.0 (2022-09-08 13:22:21 +0800)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git
>
> for you to fetch changes up to 9ebd5a558b7cd73182344b42ba88b75520446407:
>
>   rtw89: 8852c: update fw to v0.27.42.0 (2022-09-08 13:22:21 +0800)

Pulled and pushed out.

josh
