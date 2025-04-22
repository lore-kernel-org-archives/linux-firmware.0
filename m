Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486A1C369C2
	for <linux-firmware@archiver.kernel.org>; Tue, 22 Apr 2025 18:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C1D8C4CEEF; Tue, 22 Apr 2025 18:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EABE7C4CEED
	for <linux-firmware@kernel.org>; Tue, 22 Apr 2025 18:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745347106;
	bh=+kNxp/A+U9GSqZcn4vxka+ibLrr7IszlwCqaSAtCUQg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=A9oWRGw9RhHq0YFUzAf5MEBX6VzNcUTS/6q9zyRXgwZqnVB0c5QYnjAGY6QiNc2Ug
	 yLTpIPur9ADlWBdmZJV306WOoaY7BZ6Lt5Wpf/wfmFAUupchYV5lrekSis/yz1rA2R
	 DIPGtwKcNdt7lXOnyIoVZYbjgbhiOjSO0RcfyYJSDdHzlFPR7qVwcixya41KjssJE+
	 eZRy6re93BFbZsHtNnUEI2mdYpXGX2oYKBJl7PmHzYjnTCQGBnhizW8d1AetEMbWK1
	 sP7MzOxb9ak27fUMCddm5a6SsbJQhI3FZDvSUdrAbYQfaTPWnVAzCanM4DThbPJ5w3
	 6jmOElHPUYDKA==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70433283ba7so47986267b3.2
        for <linux-firmware@kernel.org>; Tue, 22 Apr 2025 11:38:25 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy6DJhYLbBbuxwyCBMf1DvCObvTqwcaCKZraqd//vaC1tPWaShB
	E5MgytGYfvVwnoSgiSE77DjupIX+M5nVjQT1GsLj+lrMN8+7kLkvQXATG+IqLwuujknZs1GCgtp
	lXEzzNpsu4Uw6S8B2jQdLVHCIqz8=
X-Google-Smtp-Source: AGHT+IGhCj94mz9UteZMHP+OLoMcjVsjWNf0oWIPRl97Zl/2b3gA6oI6AoSEC+Wmp+55vTPVw4X3mcmOlztUH3MZvq8=
X-Received: by 2002:a05:690c:6c8b:b0:6fb:5498:70fa with SMTP id
 00721157ae682-706ccd1ef58mr242417657b3.18.1745347104914; Tue, 22 Apr 2025
 11:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <MW5PR11MB58100A92BD9FBA1CD1D2578FA3BB2@MW5PR11MB5810.namprd11.prod.outlook.com>
In-Reply-To: <MW5PR11MB58100A92BD9FBA1CD1D2578FA3BB2@MW5PR11MB5810.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 22 Apr 2025 14:38:14 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4aSajj5045wZFX59TMq+uhAX3rO1kB4qRywPtVsiZ_tA@mail.gmail.com>
X-Gm-Features: ATxdqUGwC2-QFUXggkrcBnrq9oomBUgvxQYkqKG7dGISwBuiJpb_Uu3b0S5lIUc
Message-ID: <CA+5PVA4aSajj5045wZFX59TMq+uhAX3rO1kB4qRywPtVsiZ_tA@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2025-04-22
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"Hutchings, Ben" <ben@decadent.org.uk>, "Dreyfuss, Haim" <haim.dreyfuss@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 1:40=E2=80=AFPM Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Hi,
>
>
>
> This contains the missing -97 FW and PNVM for Bz-hr.
>
> This wasn=E2=80=99t released with the other -97 FWs
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
>
> The following changes since commit 944acaa23457ec6dcc33f4e7d9920a892debba=
9c:
>
>
>
>   Merge branch 'robot/pr-0-1745319312' into 'main' (2025-04-22 11:17:48 +=
0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2025-04-22

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/525

josh

>
>
>
> for you to fetch changes up to 821f99ab2308103a51b1fcefb938885e3f5573b5:
>
>
>
>   iwlwifi: add Bz-hr FW for core93-123 release (2025-04-22 20:02:13 +0300=
)
>
>
>
> ----------------------------------------------------------------
>
> core95 release
>
>
>
> ----------------------------------------------------------------
>
> Miri Korenblit (1):
>
>       iwlwifi: add Bz-hr FW for core93-123 release
>
>
>
>  WHENCE                       |   5 +++++
>
>  iwlwifi-bz-b0-hr-b0-96.ucode | Bin 0 -> 1570700 bytes
>
>  iwlwifi-bz-b0-hr-b0.pnvm     | Bin 0 -> 1788 bytes
>
>  3 files changed, 5 insertions(+)
>
>  create mode 100644 iwlwifi-bz-b0-hr-b0-96.ucode
>
>  create mode 100644 iwlwifi-bz-b0-hr-b0.pnvm
