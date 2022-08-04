Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC7BC19F2B
	for <linux-firmware@archiver.kernel.org>; Thu,  4 Aug 2022 11:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A844DC433B5; Thu,  4 Aug 2022 11:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F511C433D6;
	Thu,  4 Aug 2022 11:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659613113;
	bh=z21kJlvXvK0Q1+3ihbfUBguejdVuOWAqRLEEuOwiA3k=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Js5ktWm62Oi4vP+Js2Ebwslma5qDi45NR8EDM4NYqKv9prLobzASrwHYJIdnS1tEQ
	 6EJfOhTPzOEQe3510B9sHIt4dsW0G7eaLwRs8N8L2VWrIlDVyOmcMOofUFEl7onQBH
	 Tanjy/y2DKghva3NqsY5sqnBWha/RjbTsqcA/wcHYAHBfDfs4sRHROro8V7pA2c1m/
	 nqTvTujaprj3SZJxyLk13N4zNDcDBCFldnZAfmbPXQGH2mYppw3Ei+18K6KYWSMvFg
	 ChluU17kP2tS28NwC4rDlHkNrmKsdh2eLjOyybJKRiN7A3ujpbzwLfQkY5hTquWq4m
	 she53M4wQuqBg==
Received: by mail-io1-f42.google.com with SMTP id q124so1980960iod.3;
        Thu, 04 Aug 2022 04:38:33 -0700 (PDT)
X-Gm-Message-State: ACgBeo0vJ1/jvwtB6TYovSvjrOr8mdulmX7N/m2cJ0Cjmu7P0BjGN06I
	hF9FwVa7OhiTkqjIWFRd6Jhw9rM/L1TGYCmOe/U=
X-Google-Smtp-Source: AA6agR7vKOQmlcvnZcvt2RxPpnVC+Au4MKVLJ5uNEnCmnJS/225rP/rRD6yUwokzgZAjnX4Xf5V+8XAC9dKG0kJ6r4o=
X-Received: by 2002:a05:6638:d93:b0:341:5cab:4d9 with SMTP id
 l19-20020a0566380d9300b003415cab04d9mr665886jaj.146.1659613112752; Thu, 04
 Aug 2022 04:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220801180229.3824606-1-John.C.Harrison@Intel.com>
In-Reply-To: <20220801180229.3824606-1-John.C.Harrison@Intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 4 Aug 2022 07:38:22 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7p-Z+FDoX2mavn2CtTxgRYZMdww1bxZywaAg5r2zXZrw@mail.gmail.com>
Message-ID: <CA+5PVA7p-Z+FDoX2mavn2CtTxgRYZMdww1bxZywaAg5r2zXZrw@mail.gmail.com>
Subject: Re: PR for new GuC v70.4.1 for DG2
To: John.C.Harrison@intel.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kyle@kernel.org, ben@decadent.org.uk, 
	intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 1, 2022 at 2:02 PM <John.C.Harrison@intel.com> wrote:
>
> The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66:
>
>   amdgpu partially revert "amdgpu: update beige goby to release 22.20" (2022-07-25 14:16:04 -0400)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware dg2_guc_v70.4.1

Pulled and pushed out.  Thank you.

josh

>
> for you to fetch changes up to a4235e0aa4d4753119fd81f582eef84addf3f4a1:
>
>   i915: Add GuC v70.4.1 for DG2 (2022-07-27 18:03:49 -0700)
>
> ----------------------------------------------------------------
> John Harrison (1):
>       i915: Add GuC v70.4.1 for DG2
>
>  WHENCE                  |   3 +++
>  i915/dg2_guc_70.4.1.bin | Bin 0 -> 369600 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 i915/dg2_guc_70.4.1.bin
