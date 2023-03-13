Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB7FC61DA4
	for <linux-firmware@archiver.kernel.org>; Mon, 13 Mar 2023 13:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16E90C4339B; Mon, 13 Mar 2023 13:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015C8C433A0
	for <linux-firmware@kernel.org>; Mon, 13 Mar 2023 13:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678713698;
	bh=1xLaIhu0tpmuelU0lIlgT/DLondM1DpbQOU9sYddykM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=blGlcOJCn1NJ3L8kAJaDNGwIwSUWyygI+qk6EFfu9U/i85j6J9vpbbmZ19gybPQeo
	 pG7p3ZL8l1st5by0FhvqbBdG3ppUGxVhxwnV5XAmH1DkCbon8QKMppn80SEI/6Sugd
	 cdW6aoc0BsXV+D8ntHreSs0bFbQXq5LbWLufyTFUvX20ticHCV6Zln9eJqKmudraal
	 mGufxsFsGx0iTYZSWLSKuXv2KlsJ97KpVsgBgfjTCBw1/4RSABsA7ZbmZ0GnunFbLA
	 iEfmTQZiHKzADfaEPtfFT5MxeGYd3VWodmdTiEUVzBHSF14XxUvDY6jCns01eOFSp9
	 qm9ENW9VJWr5w==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-53916ab0c6bso241647307b3.7
        for <linux-firmware@kernel.org>; Mon, 13 Mar 2023 06:21:37 -0700 (PDT)
X-Gm-Message-State: AO0yUKVWs3lQjMJ6Od+hiiZkSyCUw2Mi2gdcsdhxM/tyJqpFYsUqCYeC
	ojSAn87crJjxxnztlADtCokeKTUKMve07P4u1Y4=
X-Google-Smtp-Source: AK7set93sy0ZlqkWOvinri8N4ovzFSfYjOrayYexnpw/L3zUG4dIQOc3y8eQ4kL1I2Qq57/SizMpP2W/oq4FUjT8VWA=
X-Received: by 2002:a81:b70d:0:b0:541:9063:8e9e with SMTP id
 v13-20020a81b70d000000b0054190638e9emr2830513ywh.2.1678713697020; Mon, 13 Mar
 2023 06:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <7d3659e81094ca968fb2847176a410e27634df2f.camel@intel.com>
In-Reply-To: <7d3659e81094ca968fb2847176a410e27634df2f.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 13 Mar 2023 09:21:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4aODy25QWPkag72BCOUiW1L2ei1N5kJ6X6j-0KfiUjRA@mail.gmail.com>
Message-ID: <CA+5PVA4aODy25QWPkag72BCOUiW1L2ei1N5kJ6X6j-0KfiUjRA@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2023-03-13 - fixed
To: "Greenman, Gregory" <gregory.greenman@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"kyle@infradead.org" <kyle@infradead.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 4:20=E2=80=AFAM Greenman, Gregory
<gregory.greenman@intel.com> wrote:
>
> Hi,
>
> This contains a fixed pull request with updated firmwares for So device f=
or our currently
> maintained FW binaries.
>
> Please pull or let me know if there are any issues.
>
> Thanks,
> Gregory
>
> The following changes since commit 588dd07134daf4b0f6f74698f24eeb74ebe900=
12:
>
>   qat: update licence text (2023-03-10 07:40:25 -0500)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2023-03-13

Pulled and pushed out.

josh

>
> for you to fetch changes up to 5bc279fb161d529baaf8e837d900235fbbe9bf2f:
>
>   iwlwifi: update core69 and core72 firmwares for So device (2023-03-13 1=
0:05:47 +0200)
>
> ----------------------------------------------------------------
> Firmware updates for So device based on core69 and core72
>
> ----------------------------------------------------------------
> Gregory Greenman (1):
>       iwlwifi: update core69 and core72 firmwares for So device
>
>  WHENCE                        |   8 ++++----
>  iwlwifi-so-a0-gf-a0-72.ucode  | Bin 1560532 -> 1560532 bytes
>  iwlwifi-so-a0-gf-a0-74.ucode  | Bin 1577460 -> 1577460 bytes
>  iwlwifi-so-a0-gf4-a0-72.ucode | Bin 1580900 -> 1580900 bytes
>  iwlwifi-so-a0-gf4-a0-74.ucode | Bin 1602068 -> 1602068 bytes
>  5 files changed, 4 insertions(+), 4 deletions(-)
