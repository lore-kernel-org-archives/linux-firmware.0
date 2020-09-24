Return-Path: <SRS0=xyIz=DB=intel.com=rodrigo.vivi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA79AC4346E
	for <linux-firmware@archiver.kernel.org>; Thu, 24 Sep 2020 23:40:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B847D21D24; Thu, 24 Sep 2020 23:40:18 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8007720B1F;
	Thu, 24 Sep 2020 23:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8007720B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=rodrigo.vivi@intel.com
IronPort-SDR: qy43vsZeMEVbCdnZNJcv2Bmx9E7U6ouY/ypeNfowmPh+eY9wZi0/ryit3YyC4OFLfNeCqIvaud
 oNvkIahP7GtQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="149037658"
X-IronPort-AV: E=Sophos;i="5.77,299,1596524400"; 
   d="scan'208";a="149037658"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2020 16:40:17 -0700
IronPort-SDR: I1bjAjvMzNSzZ1jDsYH0pKjHdVwcgzsniD5Uz8fE7x2Kq1yhiqI64ya7y5RF2GMw3qXP8Z8bSj
 1BefmSBHXiDA==
X-IronPort-AV: E=Sophos;i="5.77,299,1596524400"; 
   d="scan'208";a="455566008"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.165.21.201])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2020 16:40:17 -0700
Date: Thu, 24 Sep 2020 19:42:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org,
	=?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Anusha Srivatsa <anusha.srivatsa@intel.com>,
	Tom O'Rourke <Tom.O'Rourke@intel.com>
Subject: Re: [PATCH] linux-firmware: move i915 firmware symlinks to WHENCE
Message-ID: <20200924234226.GA1213305@intel.com>
References: <20200919191803.804897-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200919191803.804897-1-pbrobinson@gmail.com>

On Sat, Sep 19, 2020 at 08:18:03PM +0100, Peter Robinson wrote:
> There's a handful of firmware symlinks in the i915 firmware
> directory, move the creation of these to the WHENCE file.

Hm, interesting. I had never noticed this possibility.


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> CC: José Roberto de Souza <jose.souza@intel.com>
> CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> CC: Anusha Srivatsa <anusha.srivatsa@intel.com>
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> CC: Tom O'Rourke <Tom.O'Rourke@intel.com>
> ---
>  WHENCE                | 8 ++++----
>  i915/bxt_dmc_ver1.bin | 1 -
>  i915/kbl_dmc_ver1.bin | 1 -
>  i915/skl_dmc_ver1.bin | 1 -
>  i915/skl_guc_ver6.bin | 1 -
>  5 files changed, 4 insertions(+), 8 deletions(-)
>  delete mode 120000 i915/bxt_dmc_ver1.bin
>  delete mode 120000 i915/kbl_dmc_ver1.bin
>  delete mode 120000 i915/skl_dmc_ver1.bin
>  delete mode 120000 i915/skl_guc_ver6.bin
> 
> diff --git a/WHENCE b/WHENCE
> index 884490d..4faf0d0 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -4012,15 +4012,15 @@ Driver: i915 -- Intel Integrated Graphics driver
>  File: i915/skl_dmc_ver1_23.bin
>  File: i915/skl_dmc_ver1_26.bin
>  File: i915/skl_dmc_ver1_27.bin
> -File: i915/skl_dmc_ver1.bin
> +Link: i915/skl_dmc_ver1.bin -> skl_dmc_ver1_26.bin
>  Version: DMC API/ABI ver 1 - release 27 for Skylake
>  
>  File: i915/bxt_dmc_ver1_07.bin
> -File: i915/bxt_dmc_ver1.bin
> +Link: i915/bxt_dmc_ver1.bin -> bxt_dmc_ver1_07.bin
>  Version: DMC API/ABI ver 1 - release 07 for Broxton
>  
>  File: i915/kbl_dmc_ver1_01.bin
> -File: i915/kbl_dmc_ver1.bin
> +Link: i915/kbl_dmc_ver1.bin -> kbl_dmc_ver1_01.bin
>  Version: DMC API/ABI ver 1 - release 01 for Kabylake
>  
>  File: i915/kbl_dmc_ver1_04.bin
> @@ -4034,7 +4034,7 @@ File: i915/skl_guc_ver4.bin
>  Version: Guc API/ABI ver 4 - release 3 for Skylake
>  
>  File: i915/skl_guc_ver6_1.bin
> -File: i915/skl_guc_ver6.bin
> +Link: i915/skl_guc_ver6.bin -> skl_guc_ver6_1.bin
>  Version: Guc API/ABI ver 6 - release 1 for Skylake
>  
>  File: i915/skl_guc_ver9_33.bin
> diff --git a/i915/bxt_dmc_ver1.bin b/i915/bxt_dmc_ver1.bin
> deleted file mode 120000
> index 173ccf5..0000000
> --- a/i915/bxt_dmc_ver1.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -bxt_dmc_ver1_07.bin
> \ No newline at end of file
> diff --git a/i915/kbl_dmc_ver1.bin b/i915/kbl_dmc_ver1.bin
> deleted file mode 120000
> index 914ca55..0000000
> --- a/i915/kbl_dmc_ver1.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -kbl_dmc_ver1_01.bin
> \ No newline at end of file
> diff --git a/i915/skl_dmc_ver1.bin b/i915/skl_dmc_ver1.bin
> deleted file mode 120000
> index 02e7b32..0000000
> --- a/i915/skl_dmc_ver1.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -skl_dmc_ver1_26.bin
> \ No newline at end of file
> diff --git a/i915/skl_guc_ver6.bin b/i915/skl_guc_ver6.bin
> deleted file mode 120000
> index 9bd545c..0000000
> --- a/i915/skl_guc_ver6.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -skl_guc_ver6_1.bin
> \ No newline at end of file
> -- 
> 2.26.2
> 
