Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A71C54E58
	for <linux-firmware@archiver.kernel.org>; Mon, 11 Mar 2024 13:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DE6AC433A6; Mon, 11 Mar 2024 13:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88599C43394
	for <linux-firmware@kernel.org>; Mon, 11 Mar 2024 13:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710162468;
	bh=iJSF3pOyQboSN81mQk/XIAIcz84STGG/+Xnlwqjv8Y4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FMRFSmZO7iKfBErUktPN7styxZ3QIF2VvSenGwZK0Z6hAy28fj56KxALICWm3FqWj
	 tmqGqfER9PAX5JnDJO2BFxQS+MneEdmJm+aVrT2sxijiR99hiz4c/lucu2g10XjPpv
	 M4jme0T/myl4bHkykO7Uc8HDyexxS+oy80NyqbeCFJZ3jLcX0Dv/ioQbPhKV35UP2q
	 PIWg6KvsLgKyRpNIxNlcPL6cOfiK0ShtsIQkWG6FGfPl/fka4wzrd2onMbxOdf13N3
	 +Fqk15duD2Fd1xRHEpVDJBjSM4BJqlTrqtIbxEFk7vaIT1Jex6SlLqtkSEvEXedI8N
	 wQYej0ZIMDsFQ==
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcbc00f6c04so2654485276.3
        for <linux-firmware@kernel.org>; Mon, 11 Mar 2024 06:07:48 -0700 (PDT)
X-Gm-Message-State: AOJu0YxMsx/mLLdIeT1ZqFUvBSnL781heQ+9kn3UgC4xTHboL/cip2V4
	Lkh/1po87Hba8MSuonLMSG5HHHULBFUMUN/ZVgEhfstArkS4j6+4etJlsyNb7d8L6cpL3MoyqH0
	UM5CxLUwQSwuoKof8pCeyJzcQL5w=
X-Google-Smtp-Source: AGHT+IGaYbJJ1hvNCOBj9a71imA+IZtArlGCz0TGOErRDLT72N/3Iarb+W20DEOiMIA9JlFDASk3i52nVw8D3fd/g4Y=
X-Received: by 2002:a25:ef42:0:b0:dc6:d22e:ef4c with SMTP id
 w2-20020a25ef42000000b00dc6d22eef4cmr4180962ybm.17.1710162467647; Mon, 11 Mar
 2024 06:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <MW5PR11MB5810480B7EDF962BCEBB911BA3252@MW5PR11MB5810.namprd11.prod.outlook.com>
In-Reply-To: <MW5PR11MB5810480B7EDF962BCEBB911BA3252@MW5PR11MB5810.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 11 Mar 2024 09:07:36 -0400
X-Gmail-Original-Message-ID: <CA+5PVA68ks8fiibKDvrgRxfa7up9_=4WtMKd4q3_BU2sTJkcyQ@mail.gmail.com>
Message-ID: <CA+5PVA68ks8fiibKDvrgRxfa7up9_=4WtMKd4q3_BU2sTJkcyQ@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2024-03-10
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"Hutchings, Ben" <ben@decadent.org.uk>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 10, 2024 at 8:49=E2=80=AFAM Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Hi,
>
>
>
> This contains some new and updated firmwares for 9000-family devices.
>
> maintained FW binaries.
>
>
>
> Please pull or let me know if there are any issues.
>
>
>
> --
>
> Thanks,
>
> Miri
>
>
> The following changes since commit 92010357fbc692ace5883e7480e9cc3c966480=
fb:
>
>
>
>   Merge branch 'robot/patch-0-1709895245' into 'main' (2024-03-08 13:33:3=
9 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2024-03-10

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/170

josh

>
>
>
> for you to fetch changes up to 195e420f34c5c029d27ee57c57e3b3a8a164f8c4:
>
>
>
>   iwlwifi: update 9000-family firmwares to core85-89 (2024-03-10 14:27:22=
 +0200)
>
>
>
> ----------------------------------------------------------------
>
> update 9000-family firmwares to core85-89
>
>
>
> ----------------------------------------------------------------
>
> Miri Korenblit (1):
>
>       iwlwifi: update 9000-family firmwares to core85-89
>
>
>
>  WHENCE                            |   4 ++--
>
>  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1518772 -> 1519568 bytes
>
>  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1489652 -> 1490508 bytes
>
>  3 files changed, 2 insertions(+), 2 deletions(-)
