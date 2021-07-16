Return-Path: <SRS0=AA48=MI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3557BC12002
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Jul 2021 11:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF6D2613FB
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Jul 2021 11:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF6D2613FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A436E964;
	Fri, 16 Jul 2021 11:50:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547106E95A
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Jul 2021 11:50:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22506613F7
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Jul 2021 11:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626436252;
 bh=xcNbzUM0jOKcvRuRK2UanANiRRhD1nezF/UVAx3PB2g=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=SKp/RMdUhP6S7qVSnkyb1QyYWdbeHQKlh1/YrsYIUBlSW+YJX5cg1+A5X/tuA3TWg
 Z2oErahvE5lLdC1R/uH/pabssrSOgsOuz3jGBxR0yVP8WFwPA7828YWZlfuXcfGpq1
 0/h+kKkoa56ev1eVAbomQqBPKdjbdIs2KCFSZHT38yn93chOKa3pCkCEQ8GeQLGZwp
 eOiw0wQ5okcWdOJ6Bxa/4RU0brNDGpF5ew2riPLvURnWXQJ+FlmwEnJWbPp5ytUxR/
 BVGUC8WYSnc1Yka7RHm1pAEGsNWifimgM7KaEvSw8DJaUdxQTMbVaaXInyrQuBSlCC
 sAXVD+APgoOTg==
Received: by mail-io1-f53.google.com with SMTP id d9so10223950ioo.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Jul 2021 04:50:52 -0700 (PDT)
X-Gm-Message-State: AOAM530r/5iCG0hoJDe4w2JUMdJNN2Uqoq87UOIO9q82HJLXRgo8RT/t
 0UFYSurtJ5jYvctNKSoGcUNee/4BuWy8tnUK3TI=
X-Google-Smtp-Source: ABdhPJy6zOSVr9MJ3cW46LUnC7WNx2PLe3w1izhq0r6Y5fbxSQIM5Sss+eX1SEH5y8PgE1vMH2C9KmS0/ga4Nyw0bEM=
X-Received: by 2002:a05:6638:3292:: with SMTP id
 f18mr8806184jav.120.1626436251664; 
 Fri, 16 Jul 2021 04:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210708175025.333468-1-John.C.Harrison@Intel.com>
In-Reply-To: <20210708175025.333468-1-John.C.Harrison@Intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 16 Jul 2021 07:50:40 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5Z5_kgsOwvrW8KYSs=E9X=qqZKLRCNGMdj3MYWg1QmuA@mail.gmail.com>
Message-ID: <CA+5PVA5Z5_kgsOwvrW8KYSs=E9X=qqZKLRCNGMdj3MYWg1QmuA@mail.gmail.com>
To: John.C.Harrison@intel.com
Subject: Re: [Intel-gfx] PR for new GuC v62.0.3 and HuC v7.9.3 binaries
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
List-Id: <linux-firmware.lore.kernel.org>
Cc: intel-gfx@lists.freedesktop.org, kyle@kernel.org, ben@decadent.org.uk,
 linux-firmware@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
Message-ID: <20210716115040.ZAZOsbxhFo306Y73IKj_Y1HoASLge7Vpq138v0zHMAA@z>

On Thu, Jul 8, 2021 at 1:50 PM <John.C.Harrison@intel.com> wrote:
>
> The following changes since commit d79c26779d459063b8052b7fe0a48bce4e08d0d9:
>
>   amdgpu: update vcn firmware for green sardine for 21.20 (2021-06-29 07:26:03 -0400)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware guc_62.0_huc_7.9
>
> for you to fetch changes up to f4d897acd200190350a5f2148316c51c6c57bc9b:
>
>   firmware/i915/guc: Add HuC v7.9.3 for TGL & DG1 (2021-06-29 14:20:03 -0700)
>
> ----------------------------------------------------------------
> John Harrison (3):
>       firmware/i915/guc: Add GuC v62.0.0 for all platforms
>       firmware/i915/guc: Add GuC v62.0.3 for ADL-P
>       firmware/i915/guc: Add HuC v7.9.3 for TGL & DG1

Pulled and pushed out.

josh

>
>  WHENCE                   |  38 +++++++++++++++++++++++++++++++++++++-
>  i915/adlp_guc_62.0.3.bin | Bin 0 -> 336704 bytes
>  i915/bxt_guc_62.0.0.bin  | Bin 0 -> 199616 bytes
>  i915/cml_guc_62.0.0.bin  | Bin 0 -> 200448 bytes
>  i915/dg1_guc_62.0.0.bin  | Bin 0 -> 315648 bytes
>  i915/dg1_huc_7.9.3.bin   | Bin 0 -> 589888 bytes
>  i915/ehl_guc_62.0.0.bin  | Bin 0 -> 327488 bytes
>  i915/glk_guc_62.0.0.bin  | Bin 0 -> 200000 bytes
>  i915/icl_guc_62.0.0.bin  | Bin 0 -> 327488 bytes
>  i915/kbl_guc_62.0.0.bin  | Bin 0 -> 200448 bytes
>  i915/skl_guc_62.0.0.bin  | Bin 0 -> 199552 bytes
>  i915/tgl_guc_62.0.0.bin  | Bin 0 -> 326016 bytes
>  i915/tgl_huc_7.9.3.bin   | Bin 0 -> 589888 bytes
>  13 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 i915/adlp_guc_62.0.3.bin
>  create mode 100644 i915/bxt_guc_62.0.0.bin
>  create mode 100644 i915/cml_guc_62.0.0.bin
>  create mode 100644 i915/dg1_guc_62.0.0.bin
>  create mode 100644 i915/dg1_huc_7.9.3.bin
>  create mode 100644 i915/ehl_guc_62.0.0.bin
>  create mode 100644 i915/glk_guc_62.0.0.bin
>  create mode 100644 i915/icl_guc_62.0.0.bin
>  create mode 100644 i915/kbl_guc_62.0.0.bin
>  create mode 100644 i915/skl_guc_62.0.0.bin
>  create mode 100644 i915/tgl_guc_62.0.0.bin
>  create mode 100644 i915/tgl_huc_7.9.3.bin
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
