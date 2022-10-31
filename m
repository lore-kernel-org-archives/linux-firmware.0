Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FA5FA3741
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Oct 2022 15:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D88A8C4347C; Mon, 31 Oct 2022 15:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2807C433B5
	for <linux-firmware@kernel.org>; Mon, 31 Oct 2022 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667229166;
	bh=8tLJDHyZilyaowTg5QSui8IysE554ZkEfFlvm0SUBvQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=OhG/ZqEmITmcQ2FAi+q6czGz9s7Lub8HGHMXW2qMchiiTc/6If8uNqjTjugcSdbU3
	 4d1AUHnurdQvfQlEYIgfgtn/dbRPNaJgfeeYkU+nuLDHeBf9V/TwhjKELrS97JU2MY
	 tf3NbNvIFzbKZ/IA0ONi+KyYMLXN23bGlgeIg6xYI8hflmwMXBiCZ+SNyiRrNn3x3q
	 Q8VjrAbWXvHjAIViiRMELMb9Q5YYennuQjW7hGRCs44qUyV8JY3EyA11sR6xsQnXVi
	 KK+r9OXmzbIqsTtatE/lyByO2PCyV/BzpfOPy+zCrwZQVfVhTFARzep9J7ydw6btLr
	 X13Lit1ndBdcQ==
Received: by mail-oi1-f178.google.com with SMTP id l5so13070990oif.7
        for <linux-firmware@kernel.org>; Mon, 31 Oct 2022 08:12:46 -0700 (PDT)
X-Gm-Message-State: ACrzQf0Xj4T8cjSlOt2Uv0sqIDFMZJ5bxjpMaro4i4m5V1RIXMczghcZ
	gnFfGZN8gWpxye51w8wXXp2DMVVOXQaKlAaqqmY=
X-Google-Smtp-Source: AMsMyM5hIXgvLae3KcbGhuMb2PYl9HnazfxXaXYeSrQIAzMRVlWFaMKhrhGqV1bCrFGb7BSwj/Eo12rWL5idVx9cY2E=
X-Received: by 2002:a05:6808:1591:b0:359:e9f6:e349 with SMTP id
 t17-20020a056808159100b00359e9f6e349mr5871108oiw.267.1667229165867; Mon, 31
 Oct 2022 08:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <2a263d2d6c82b482dfb5933d1be990aed918b7b1.camel@intel.com>
In-Reply-To: <2a263d2d6c82b482dfb5933d1be990aed918b7b1.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 31 Oct 2022 11:12:35 -0400
X-Gmail-Original-Message-ID: <CA+5PVA78_ZB+BWhs-z5j5vRg8cUED_53Nq_zz1V_jK9sOsW3=Q@mail.gmail.com>
Message-ID: <CA+5PVA78_ZB+BWhs-z5j5vRg8cUED_53Nq_zz1V_jK9sOsW3=Q@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2022-10-26
To: "Greenman, Gregory" <gregory.greenman@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, 
	"kyle@infradead.org" <kyle@infradead.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"Yang, You-Sheng" <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 26, 2022 at 6:57 AM Greenman, Gregory
<gregory.greenman@intel.com> wrote:
>
> Hi,
>
> The following contains some updated firmares for all our currently
> maintained FW binaries as well as updated PNVM files.
>
> Please pull or let me know if there are any issues.
>
> --
> Thanks,
> Gregory
>
> The following changes since commit 0cac82d36af9f9b1d3e532dccf0c690408ccb454:
>
>   Merge branch 'for-upstream' of https://github.com/CirrusLogic/linux-firmware (2022-10-24 12:07:56 -0400)
>
> are available in the Git repository at:
>
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2022-10-26
>
> for you to fetch changes up to 20d9516de4cdc041e2aa83009e5b0464b1c3ed81:
>
>   iwlwifi: add new PNVM binaries from core74-44 release (2022-10-26 13:11:49 +0300)
>
> ----------------------------------------------------------------
> iwlwifi: add core69 FW and update PNVM binaries from core74
>
> ----------------------------------------------------------------
> Gregory Greenman (2):
>       iwlwifi: add new FWs from core69-81 release
>       iwlwifi: add new PNVM binaries from core74-44 release

Pulled and pushed out.

josh

>
>  WHENCE                        |  36 ++++++++++++++++++++++++++++++++++++
>  iwlwifi-Qu-b0-hr-b0-72.ucode  | Bin 0 -> 1370236 bytes
>  iwlwifi-Qu-b0-jf-b0-72.ucode  | Bin 0 -> 1285968 bytes
>  iwlwifi-Qu-c0-hr-b0-72.ucode  | Bin 0 -> 1370252 bytes
>  iwlwifi-Qu-c0-jf-b0-72.ucode  | Bin 0 -> 1285984 bytes
>  iwlwifi-QuZ-a0-hr-b0-72.ucode | Bin 0 -> 1370356 bytes
>  iwlwifi-QuZ-a0-jf-b0-72.ucode | Bin 0 -> 1286088 bytes
>  iwlwifi-cc-a0-72.ucode        | Bin 0 -> 1329780 bytes
>  iwlwifi-so-a0-gf-a0-72.ucode  | Bin 0 -> 1560532 bytes
>  iwlwifi-so-a0-gf-a0.pnvm      | Bin 41808 -> 42092 bytes
>  iwlwifi-so-a0-gf4-a0-72.ucode | Bin 0 -> 1580900 bytes
>  iwlwifi-so-a0-hr-b0-72.ucode  | Bin 0 -> 1470384 bytes
>  iwlwifi-so-a0-jf-b0-72.ucode  | Bin 0 -> 1406312 bytes
>  iwlwifi-ty-a0-gf-a0-72.ucode  | Bin 0 -> 1499284 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm      | Bin 41588 -> 41876 bytes
>  15 files changed, 36 insertions(+)
>  create mode 100644 iwlwifi-Qu-b0-hr-b0-72.ucode
>  create mode 100644 iwlwifi-Qu-b0-jf-b0-72.ucode
>  create mode 100644 iwlwifi-Qu-c0-hr-b0-72.ucode
>  create mode 100644 iwlwifi-Qu-c0-jf-b0-72.ucode
>  create mode 100644 iwlwifi-QuZ-a0-hr-b0-72.ucode
>  create mode 100644 iwlwifi-QuZ-a0-jf-b0-72.ucode
>  create mode 100644 iwlwifi-cc-a0-72.ucode
>  create mode 100644 iwlwifi-so-a0-gf-a0-72.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0-72.ucode
>  create mode 100644 iwlwifi-so-a0-hr-b0-72.ucode
>  create mode 100644 iwlwifi-so-a0-jf-b0-72.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-72.ucode
