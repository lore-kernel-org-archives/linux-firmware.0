Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26847CE7A81
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Sep 2023 12:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7923C433CD; Mon, 25 Sep 2023 12:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18A2C433CB;
	Mon, 25 Sep 2023 12:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695646039;
	bh=qKAnBEcPPWFbWDk/lCWtAE7oyMqyfwN+Vm7KYXfmtE8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=QSL2ZnpJFFTXnGl1PvQ53I4cwYeuI7oGOtVMWm1AGzNYLu6aNzZ9pwvhdhTlmGvBS
	 L+cbAzp8AhUsgIW/0cmsntyO33T1L8Uwyru0ka7AgCs1ooZpeFzpl5ItHjuovA89Eg
	 2M5bXBFMuB4bqWhYAIweBx6nuqJinSokdf/JvL9T1p3gxSddd89zP6I4+Yhb5SPzzK
	 4iTFHMG9NL81T83vLIQSLL7+p2BCXsagsWK0tfa7I9iLTF1NJP6k6zodtv2FU4sM6i
	 PxPfJE9Ff/66QIo9qGGxSnMkaMBO6kkAXwC0lB6Imw4Y+PS9kj7lpwvMvYpDkIZkt7
	 4I5lqqWcAxelw==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d8164e661abso7216808276.1;
        Mon, 25 Sep 2023 05:47:19 -0700 (PDT)
X-Gm-Message-State: AOJu0YwvDYs+hRbNYpHc3r+SJdGbH8wXvZvHEE6eRBpIioKptS7F79Cl
	hkqdu+O0V1v0KxoFSVmeX/tGrWFk0MG1htz/HUU=
X-Google-Smtp-Source: AGHT+IGfqPd+b87kgAyu1yQG5+jZgY62ftKL6aA1O980n9nqvq2szy9wf/s8ea89yjzvHDPzaQQv84FdZc5AfAjBe4U=
X-Received: by 2002:a25:1c1:0:b0:d7f:42d9:8a74 with SMTP id
 184-20020a2501c1000000b00d7f42d98a74mr5150097ybb.3.1695646038843; Mon, 25 Sep
 2023 05:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <692109191855dc0faebcf2aa710b8ef8e83dfcdb.camel@intel.com>
In-Reply-To: <692109191855dc0faebcf2aa710b8ef8e83dfcdb.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 25 Sep 2023 08:46:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5-Uo-nugPDrxsFhGc0KNPZVi=Cf1kW3YugPukWfL_rjw@mail.gmail.com>
Message-ID: <CA+5PVA5-Uo-nugPDrxsFhGc0KNPZVi=Cf1kW3YugPukWfL_rjw@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2023-09-21
To: "Greenman, Gregory" <gregory.greenman@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"kyle@infradead.org" <kyle@infradead.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"jwboyer@kernel.org" <jwboyer@kernel.org>, "Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 11:09=E2=80=AFAM Greenman, Gregory
<gregory.greenman@intel.com> wrote:
>
> Hi,
>
> This contains some new and updated firmwares for all our currently
> maintained FW binaries.
>
> Please pull or let me know if there are any issues.
>
> --
> Thanks,
> Gregory
>
> The following changes since commit 3672ccab9237315db2f3a28a47f8ac1062a5a3=
5e:
>
>   Merge branch 'mlimonci/fix-merge-requests-ci' into 'main' (2023-09-18 2=
0:19:32 +0000)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.g=
it tags/iwlwifi-fw-2023-09-21

Pulled and pushed out.

josh

>
> for you to fetch changes up to 765492b8b90e3985fe60b3cf8d386538aa38b6ac:
>
>   iwlwifi: add new FWs from core81-65 release (2023-09-21 17:59:01 +0300)
>
> ----------------------------------------------------------------
> iwlwifi firmware from core81-65 release
>
> ----------------------------------------------------------------
> Gregory Greenman (2):
>       iwlwifi: update cc/Qu/QuZ firmwares for core81-65 release
>       iwlwifi: add new FWs from core81-65 release
>
>  WHENCE                        |  24 ++++++++++++++++++------
>  iwlwifi-Qu-b0-hr-b0-77.ucode  | Bin 1404704 -> 1404744 bytes
>  iwlwifi-Qu-b0-jf-b0-77.ucode  | Bin 1322436 -> 1322476 bytes
>  iwlwifi-Qu-c0-hr-b0-77.ucode  | Bin 1404720 -> 1404760 bytes
>  iwlwifi-Qu-c0-jf-b0-77.ucode  | Bin 1322452 -> 1322492 bytes
>  iwlwifi-QuZ-a0-hr-b0-77.ucode | Bin 1404840 -> 1404880 bytes
>  iwlwifi-cc-a0-77.ucode        | Bin 1366144 -> 1366184 bytes
>  iwlwifi-so-a0-gf-a0-84.ucode  | Bin 0 -> 1737644 bytes
>  iwlwifi-so-a0-gf-a0.pnvm      | Bin 55580 -> 55580 bytes
>  iwlwifi-so-a0-gf4-a0-84.ucode | Bin 0 -> 1709900 bytes
>  iwlwifi-so-a0-gf4-a0.pnvm     | Bin 28064 -> 28064 bytes
>  iwlwifi-so-a0-hr-b0-84.ucode  | Bin 0 -> 1549088 bytes
>  iwlwifi-ty-a0-gf-a0-84.ucode  | Bin 0 -> 1676912 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm      | Bin 55484 -> 55484 bytes
>  14 files changed, 18 insertions(+), 6 deletions(-)
>  create mode 100644 iwlwifi-so-a0-gf-a0-84.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0-84.ucode
>  create mode 100644 iwlwifi-so-a0-hr-b0-84.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-84.ucode
