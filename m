Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856C7C00140
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Aug 2022 12:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D937C433B5; Mon, 15 Aug 2022 12:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E58C433C1
	for <linux-firmware@kernel.org>; Mon, 15 Aug 2022 12:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660568179;
	bh=x4ox+IA7lFYEIubZfuygND8R02z/kFhaXMUyg9jLLcU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=vQDMyPI4YaGGzWqzONZ3cIK8ssUhNOXnNvFkviTx8PUek3rc28JHMNwh0rd/9HiUn
	 OaMD8/Hf+s12G+lTMsAB0rsQGdAYsE/6fEA4Oq9OBF1nhVX0VLSTP2NY25gWuLvyFZ
	 dGUlDvNzpZpFVjt1kNL30MR/0kJ03xe74L0sPCwJw8nvvxdKHYNHfEJaAWj5QNFpnu
	 JPmVludZB+jjqvKasP7PvykgBfWt+ZBF3v7h9P3pZmvxxUJuWkZ0WABLK5m7jmbmi+
	 mi2/23tS4i2gcQypxW6Kp9W5LCW3gMnYgq5c3qmp9TWLm3huvGwNUSgwexGCP26DvW
	 ivW7IdpzSLhiw==
Received: by mail-il1-f182.google.com with SMTP id w8so483670ilj.5
        for <linux-firmware@kernel.org>; Mon, 15 Aug 2022 05:56:19 -0700 (PDT)
X-Gm-Message-State: ACgBeo0NmptIsqo2rKtTa7FUfAGgaPQEpna+1wviZL8NXRdQQhzq8b/s
	rvf6ZSxA90PKdXuo3NiNCbD6fWQ3aqLDAeDu+s8=
X-Google-Smtp-Source: AA6agR68cd+dnKL1jFytFFmimvTpXgbZkyMN4fCPsNIOz+LldAQVcrOGn3k3xTNlbAIV+j2bgfLzk8c7Tf+43krwBUc=
X-Received: by 2002:a05:6e02:2169:b0:2e5:bd6c:fad with SMTP id
 s9-20020a056e02216900b002e5bd6c0fadmr1846810ilv.2.1660568178418; Mon, 15 Aug
 2022 05:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <084b6f6f-a21f-14ac-4e09-1da8cd074e08@redhat.com>
In-Reply-To: <084b6f6f-a21f-14ac-4e09-1da8cd074e08@redhat.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 15 Aug 2022 08:56:07 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5BtptZvOXj8=RAmdSqn_Rk8VK4SCeYzhM4rmMgrDmgbw@mail.gmail.com>
Message-ID: <CA+5PVA5BtptZvOXj8=RAmdSqn_Rk8VK4SCeYzhM4rmMgrDmgbw@mail.gmail.com>
Subject: Re: [linux-firmware GIT PULL] Add 3 new brcmfmac nvram files
To: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 10, 2022 at 11:20 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Josh,
>
> Here is a linux-firmware pull-req to add 3 new brcmfmac nvram files,
> to make Wifi work OOTB for users on the boards needing these files.
>
> Regards,
>
> Hans
>
>
> The following changes since commit ad5ae82019480dc1feffb538c118397a40934e62:
>
>   Merge branch 'main' of https://github.com/suraj714/BT-Upstream (2022-08-10 07:58:34 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux-firmware.git brcmfmac-nvram-updates
>
> for you to fetch changes up to c58f00165b28f2ec094cafbff14b18196e1bec35:
>
>   brcm: Add nvram for Lenovo Yoga Tablet 2 830F/L and 1050F/L tablets (2022-08-10 16:27:41 +0200)
>
> ----------------------------------------------------------------
> Hans de Goede (3):
>       brcm: Add nvram for the Asus TF103C tablet
>       brcm: Add nvram for the Xiaomi Mi Pad 2 tablet
>       brcm: Add nvram for Lenovo Yoga Tablet 2 830F/L and 1050F/L tablets

Pulled and pushed out.

josh

>
>  WHENCE                                             |   3 +
>  ...1b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt | 149 +++++++++++++++++++++
>  ...mac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt | 103 ++++++++++++++
>  brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt       | 137 +++++++++++++++++++
>  4 files changed, 392 insertions(+)
>  create mode 100644 brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt
>  create mode 100644 brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt
>  create mode 100644 brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt
>
