Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373B0C77B75
	for <linux-firmware@archiver.kernel.org>; Tue, 23 May 2023 17:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1BA34C4339E; Tue, 23 May 2023 17:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BCBC433EF
	for <linux-firmware@kernel.org>; Tue, 23 May 2023 17:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684861635;
	bh=VlzOuOaMMtB/3S6DOEjZb/FPWOGpXThcoqmSbucCdpk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ucec7TsOj41hssGb+CjB5y67slHMTiNtgP2VyCt31CByDaX94BcHE+iOY+NB39t/Q
	 nKKguNxTC2Is/wIlYPX9i5clPh1g+4FC8P55qOssdnIcaWipEFdQ+lenV/d82DIZHB
	 N5DObtys+ql8bIL3DKq8PqKPuvNzDu2xZ21qSvJksms1lvVB9AlHVzqNxK894Dvg8O
	 fvuBVq5srtByzHpbVliuvbIIcaTaP38JVSlqG5NYFtx0FfLiPZSPV43OqbOWHGJPjc
	 INDswkUAfwnOJsFIGCngXA07maqEP9i47Fod7iquM1p+auLMxTD8nO+PXEREEn9uLc
	 hyPJmWcoPTemg==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-565014fc2faso30997207b3.1
        for <linux-firmware@kernel.org>; Tue, 23 May 2023 10:07:14 -0700 (PDT)
X-Gm-Message-State: AC+VfDzqydQ8hsU7/JBX83FUMT9kzCYLZ4IBls99pbt4gaF6zDA5nzfX
	dUauvvEn3ZYOTJPmndxx4JS2b8+bKzE/pzSVBPg=
X-Google-Smtp-Source: ACHHUZ4o3YYQcpE9nRIVK8m1QhfQ+n3ekmlY9hNqKH5I+u426eiyW8WwRtn201QYEzRW/7UGKNhek63ovvEkVkHnqdU=
X-Received: by 2002:a81:4603:0:b0:55a:7d83:7488 with SMTP id
 t3-20020a814603000000b0055a7d837488mr14269325ywa.9.1684861634070; Tue, 23 May
 2023 10:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <35e79df26e17bd38bfb074b71df47f40277b7510.camel@realtek.com>
In-Reply-To: <35e79df26e17bd38bfb074b71df47f40277b7510.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 23 May 2023 13:07:03 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7GuP-uf_UfE1wQk_a6N=HrMqnvycePxdewirJFcdU78g@mail.gmail.com>
Message-ID: <CA+5PVA7GuP-uf_UfE1wQk_a6N=HrMqnvycePxdewirJFcdU78g@mail.gmail.com>
Subject: Re: pull request: rtw89: 8851b: add firmware v0.29.41.0
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 2:03=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Hi,
>
> Add initial firmware of rtw89 driver for newly supported chip 8851BE.
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 601c181310ed04bec74961e65d1d316a15eb75=
4c:
>
>   Merge https://github.com/pkshih/linux-firmware (2023-05-17 07:41:33 -04=
00)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD
>
> for you to fetch changes up to 9e020241b879eb0037b1ddd340d6a9ea7f7c7932:
>
>   rtw89: 8851b: add firmware v0.29.41.0 (2023-05-19 13:57:27 +0800)
>
> ----------------------------------------------------------------
> Ping-Ke Shih (1):
>       rtw89: 8851b: add firmware v0.29.41.0

This is missing an entry in WHENCE.  Can you fix that up?

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: rtw89/rtw8851b_fw.bin not listed in WHENCE
[jwboyer@vader linux-firmware]$

josh

>
>  rtw89/rtw8851b_fw.bin | Bin 0 -> 1090544 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 rtw89/rtw8851b_fw.bin
>
