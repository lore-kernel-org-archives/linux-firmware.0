Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573A0C63797
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Jan 2023 13:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E1EAC433F1; Tue, 17 Jan 2023 13:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DC2C433EF
	for <linux-firmware@kernel.org>; Tue, 17 Jan 2023 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673960454;
	bh=6eSPw7ERwh8u6p+Ws/Tr0zibBuCMp01C9WUwwT9IZUI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Odin0vJWf50GOGcyoZxyDbGydN3tKmVH2sOZwQWmd+uKs5I2Bz4QCJg1DIkNimSEM
	 REyWb/GLSQ1aLutWraoGrmTEGsd5GTRPx/mQ2YevCdJy8gu9i+f4tR878syt/+oHEi
	 Wgh1zlpiqWP+qTHHomZlyyCHZ2cKzdbx04GPncnEdPmv7ZHsFxnDo0MIFCWqRo5BQg
	 uzUICcw6bmiKJc7L+szQl7uJyg7/SFTzOoT0MKPXpPtYaupEYcpbmM1ORi4mZi5RV8
	 QlqLp6QcahVHpprezgobdRFCpMyyi3E7FmzxWbIpxhLZisQhL90rY9n36jk3BA4MvO
	 Ur/4+Dceg7NGA==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-4d4303c9de6so270044397b3.2
        for <linux-firmware@kernel.org>; Tue, 17 Jan 2023 05:00:54 -0800 (PST)
X-Gm-Message-State: AFqh2koCv0WA0W9bOcBO9v9NPnPXgeiHgMMV5MqhOW0WDc0HGzXFkCCA
	uXr+V89Qk3wr/6G03WXsee/MB8BoRMeBufcJAH0=
X-Google-Smtp-Source: AMrXdXseVn6o7/WqITqZY1ZIaHnXCtGwWNvtzmWFzjvtmsdCt/84AC5GJqJPC1oeApJNeQ08PnNBCyQ7cwd9r58OsEY=
X-Received: by 2002:a0d:f387:0:b0:4f3:10df:2caf with SMTP id
 c129-20020a0df387000000b004f310df2cafmr107142ywf.366.1673960453220; Tue, 17
 Jan 2023 05:00:53 -0800 (PST)
MIME-Version: 1.0
References: <b00c91825affe825a7411391a10135bec0354664.camel@realtek.com>
In-Reply-To: <b00c91825affe825a7411391a10135bec0354664.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 17 Jan 2023 08:00:42 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4bizxePQd1C6yGyzQ7zbsoXFrbkSbwG1cY8AVauja+fA@mail.gmail.com>
Message-ID: <CA+5PVA4bizxePQd1C6yGyzQ7zbsoXFrbkSbwG1cY8AVauja+fA@mail.gmail.com>
Subject: Re: pull request: rtw89: 8852c: update fw to v0.27.56.10
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 17, 2023 at 7:04 AM Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Hi,
>
> Update 8852c firmware of rtw89 driver to v0.27.56.10
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit a1ad1d5b50626f2d126adf1964ce0e98cbb8b39d:
>
>   amdgpu: add VCN4.0.4 firmware from amd-5.4 (2023-01-10 10:08:40 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD

Pulled and pushed out.

josh

>
> for you to fetch changes up to fc5a25fa022c7e28ecfc2ced4ea309ad61ca142e:
>
>   rtw89: 8852c: update fw to v0.27.56.10 (2023-01-17 19:57:43 +0800)
>
> ----------------------------------------------------------------
> Ping-Ke Shih (1):
>       rtw89: 8852c: update fw to v0.27.56.10
>
>  rtw89/rtw8852c_fw.bin | Bin 1532608 -> 1532656 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
>
