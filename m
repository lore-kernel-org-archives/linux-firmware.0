Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37104C433F5
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Feb 2022 14:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20706C340F7; Mon, 28 Feb 2022 14:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B083C340F8
	for <linux-firmware@kernel.org>; Mon, 28 Feb 2022 14:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646059444;
	bh=jQt86CTns+lDyhNg2Ecbsl+Pfe+S7Scn32z0S2CijeM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fnq3Sn0XfrpS3Sudy5VI99mHmMh2J0NdJ/JijYZBwHqh4CDN1s+2ptfyTrzB6NzTa
	 AMC5CFHMVIUFnH0l4uBHaYQEFgQCBvMBz1KN//PZvQBDFF4rXII+F1H5nGfAk5NBPJ
	 S8Ko95wpbshOz8F4/ynuR0Cx9yZYGZ1WzHEeWF1e9Ldo9k3nfLjeEsqsUEVL/fS29x
	 8rPwcoY7OqqogRHTMevzp+HSJThf/kUgAMoQD8L+KebNkezOfXZDao8w7412kX1fKS
	 Ea4lkr9MH8zf1geBwC2yvb34Rc6IiKHGz09EsePND23gmav+sp//jYRfsqDUBSAyZ3
	 d/PdggEmthgGg==
Received: by mail-il1-f173.google.com with SMTP id q4so10176892ilt.0
        for <linux-firmware@kernel.org>; Mon, 28 Feb 2022 06:44:03 -0800 (PST)
X-Gm-Message-State: AOAM530XLv4RJIPnYqYTngcJK+Z5yR7l1hLID9FdrK2NjfWtGNcDigBx
	PcSnMWIpGi7CmzQ/4f3bnyKdfD52r/eYRMPj29E=
X-Google-Smtp-Source: ABdhPJxjuBgzbBfHcKoDqq7kew7gldXbTDghvL6u1y0+NvQuI41T3O5oQXp1IHvSpFdg7r0unmpx4DObAhiU95MkUF4=
X-Received: by 2002:a92:c243:0:b0:2c1:c5f5:bf5f with SMTP id
 k3-20020a92c243000000b002c1c5f5bf5fmr19177454ilo.243.1646059443156; Mon, 28
 Feb 2022 06:44:03 -0800 (PST)
MIME-Version: 1.0
References: <1f1012ed29384933b7040a562d43e424@realtek.com>
In-Reply-To: <1f1012ed29384933b7040a562d43e424@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 28 Feb 2022 09:43:52 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4nGb6bq9pc1-HDKQ-fwRqg_q9u9qt2wk7FBPSbmwyhCQ@mail.gmail.com>
Message-ID: <CA+5PVA4nGb6bq9pc1-HDKQ-fwRqg_q9u9qt2wk7FBPSbmwyhCQ@mail.gmail.com>
Subject: Re: pull request: rtw89: 8852a: update fw to v0.13.35.0
To: Pkshih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Timlee <timlee@realtek.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 24, 2022 at 9:34 PM Pkshih <pkshih@realtek.com> wrote:
>
> Hi,
>
> Sorry, I mistype address of wireless mailing list, so resend it again.
>
> Ping-Ke
> ---
> The following changes since commit c784d7a3e3c2a83e3911fd3dd0e105911a323a5f:
>
>   rtw89: 8852a: update fw to v0.13.35.0 (2022-02-25 10:04:46 +0800)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git
>
> for you to fetch changes up to c784d7a3e3c2a83e3911fd3dd0e105911a323a5f:
>
>   rtw89: 8852a: update fw to v0.13.35.0 (2022-02-25 10:04:46 +0800)

Pulled and pushed out.

josh
