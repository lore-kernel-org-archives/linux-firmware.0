Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6313C48BC3
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Feb 2024 12:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF773C433C7; Mon, 19 Feb 2024 12:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5ACC43394
	for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 12:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708347265;
	bh=cfzZ7afijUCO6xpu/ypqxdssu5di+7iyJ2FJV57yCFQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=i+fyv79vrVhPZDFw10iosiUvBEV1KeJQnuT11599wexrkwqZB/P7mutTEUDCaAVxA
	 Nahl7kVNuurH1NnbP8DW3slOCy+7M+0v4YWui+dC2THHlOLGO3iKyLbK4foi9EiZu3
	 Pt7jUAhtIdnK5OII3sW/S2ESS5HBlz7aLxlfoVrq3W4Tk6X5Fy5GWK9if/2IIEIrXg
	 5m2S6YbXJBanUiCByB6wTkZb/apzsU2hNp+sVhpy/iEhaYkc3WlBsvoBsLKU9zPzAW
	 id8NSgGNtl8Zav2ZYHI41lF1JFAEuHpnxglO4JFFRKhgxms7YKByCV9V9jiPedVq7H
	 CWIcqRDvermbA==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6080a3eecd4so21708887b3.2
        for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 04:54:25 -0800 (PST)
X-Gm-Message-State: AOJu0YwTBSLgfqdr813ghpeFeAs946RqK418/+lpNqB/u/Nmq9gC1Ipt
	WHOJFfuzVmS/4AMu+5oCh0Z7qI8LhzwsqII9eM1ep8bqAV4Rd5KVyWs0IAoJOQHsk4eJnv65Txr
	jI6wFooEhP2lDhkxYOgmfk3q2N0U=
X-Google-Smtp-Source: AGHT+IEuip7Z/I84telWa2EAm1vNg0I+zMhbT5d+CGOAyC6cFF5e0EllOjQXW0CKYEGYPRXOMcjnp5Fqhk3w2BHGfws=
X-Received: by 2002:a81:8507:0:b0:607:6fe9:f55a with SMTP id
 v7-20020a818507000000b006076fe9f55amr12511545ywf.35.1708347264885; Mon, 19
 Feb 2024 04:54:24 -0800 (PST)
MIME-Version: 1.0
References: <f49de145-d78e-4283-aff2-9074e4df67e6@opensource.cirrus.com>
In-Reply-To: <f49de145-d78e-4283-aff2-9074e4df67e6@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Feb 2024 07:54:14 -0500
X-Gmail-Original-Message-ID: <CA+5PVA69VwcWx5gSMarBCVj7TVcGTL8LPeyOojke8G80MCeebA@mail.gmail.com>
Message-ID: <CA+5PVA69VwcWx5gSMarBCVj7TVcGTL8LPeyOojke8G80MCeebA@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add CS35L41 firmware for additional ASUS
 Zenbook 2023 models
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 9:43=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 for 3 ASUS Zenbook 2023 models.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit fbef4d381e3d0143427e1a8c924be8e738c0fc=
2d:
>
>    Merge branch 'main' into 'main' (2024-02-08 12:24:01 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware/ asus_zenbook_2023

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/150

josh

>
> for you to fetch changes up to 4cccf3f90e98a6f5ec8fbe7c7b89b598ab605dd9:
>
>    linux-firmware: Add CS35L41 firmware for additional ASUS Zenbook 2023
> models (2024-02-09 14:38:07 +0000)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>        linux-firmware: Add CS35L41 firmware for additional ASUS Zenbook
> 2023 models
>
>   WHENCE | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
>
