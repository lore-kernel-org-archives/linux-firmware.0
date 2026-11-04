Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB81606A31B
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Nov 2026 14:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VdQXrOEe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TsYIkltR
Received: by smtp.kernel.org (Postfix)
	id B15EE1F00A17; Wed,  4 Nov 2026 14:08:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793801336;
	b=LhyTiawDLVV6qTgoQdldY/z8yCrPuuPDrVAfuNKBl+BpDjpKw6935wkS1NIyRYS2atyl
	 1ApznZi5LAMBffSEql9aG6K4k9nuFPWDpoINUK6TaVp8NboGf2/lvDRY30imVC/1hkEqd
	 w9+0618eoHniSP58WGfWoDqlKsEURLqs9pw2FyJ/pPV9WdjcD6+z0KwMYg7LNbKj6uqdv
	 47sazOgUoY9KshjRFknSNORdC/OEQL2/cNZYglauKK3bpbtNKcmuSuTUYFzTwfK+X4kSJ
	 GUSp9cy343KzNeHbhtTQbjoKiX+m+WTPSL5vs2Vz1R2gfYRGtSXOj+aQBsZ8sp1tRRA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793801336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i+X/nIg7Kl1NLT3cyQDdj+/n6Eh9J2E9gTlg4zspLoY=;
	b=14HQHoQdJ8XAL5CWVvl1Feanaq49/iqKfHnV8C3uqHk5uXASiTHVhEg+yIKxOF5IAf62
	 4uLbOpVLdcWHEMihOKpLGXWYr844JeJ1WRFesD/kou5wqTUFV4rR02SVTG4acqKe5Y/TB
	 OEbKurcQqc19BIyzlXOr3tvSjHl43ZmLpoEQCNFYvbL0toIstdSctsnvdEwzNjauqdI0D
	 Bpg6sqprLodmzgUGbDihybLzdiWSotjXdym27vackXg1xmC9272lwfp1C9HvJIG/1dT8Y
	 U5MpJz9+y4qNkNU6fluHHtYTmhyALV4UxwsDbasjhmv7Sdj1xLOkpQOtZMCGpCSzgjA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VdQXrOEe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TsYIkltR;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 246E41F00A21
	for <linux-firmware@kernel.org>; Wed,  4 Nov 2026 14:08:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VdQXrOEe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TsYIkltR
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 246E41F00A21
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZuLi1667553
	for <linux-firmware@kernel.org>; Wed, 4 Nov 2026 14:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i+X/nIg7Kl1NLT3cyQDdj+/n
	6Eh9J2E9gTlg4zspLoY=; b=VdQXrOEewZVdCoYa/Al0u6Q7FBGMKILB78CII0mt
	AD6u0ddjAVUbTfThKihS5w5rS6ycNjNwnvMHyF3G9Paad0/0Eoo2KE4SvK4I5i7Y
	4aBtIHSe/9J0vdzkclBF4/U2xXLRIXEdtnkTYXMHIduqJ88+ImXVQXH05WnNE4Mr
	2YMmATZinKEgANyPMoIC2KwfHmu3HRZNxso6jXuCg9tHBwWo2rmVkaLZOnYZfbif
	xYp3/9mV75SfdE3nVUfxYLQkPe4eqnK4FvA7z0gmpFOI2oalHxQZFr+9qorQLwY+
	+E19xRnoeGSrSdaQxp+G9hqabUUBriS+rUoUc9BmYPTeng==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nm4vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 04 Nov 2026 14:08:55 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaf1bb48b2so559293e0c.3
        for <linux-firmware@kernel.org>; Wed, 04 Nov 2026 06:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801334; x=1794406134; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+X/nIg7Kl1NLT3cyQDdj+/n6Eh9J2E9gTlg4zspLoY=;
        b=TsYIkltRQrzF8byV9b0NJJsizz86ZRsG4ZHdOpPS33lElcWPmwkhHntducx60P/7FC
         6v86E0Y5lfLwmtatqfAJrNN4UaVDQB11kvZKAw3Wjf/yQTMDu6a8gtcg5EcLkVAalymx
         lGfLA2ra5AxWtypTagz6xOLrVcYDLPYnacCh1dCSYdM6q88FbHCtG54QOQBW/RfH46uE
         e7xsTqoZ+YtEnJP4M4cf1W858Tk4vZBYSAJ542YykhVMhrKxPRNdCfwQIZ+dgjukcL5K
         /uTMIXtxtF/x+4SQWdgkihE1vkq1X+8Z/VtqoG0W/4rHG1nchtImwzGiSpZAxTigMwQb
         2i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801334; x=1794406134;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+X/nIg7Kl1NLT3cyQDdj+/n6Eh9J2E9gTlg4zspLoY=;
        b=ivYjJeGft3ASlimFsJ69x9nwSkt/C6fiLqyl0CrluhcFerB7cEQ8duIT+5plRIR8YD
         Xw9xygbU1mMDJBKCrCR0SGvr+wwiYDWkwWBd76Pg0UB6Gux7mS/Bvqm5ocHxCwzh+0Zb
         4BL+H6Z1Iiagw3NgcTd0FiYtLmK8nh9lOgMy2WFjJL6FW/fBqTnx+eJbKZiLNMmkt8BY
         8nqEAMurQoy5mT5HthMyTRq5vQhaIMqIXCL5NmBNwWZ9DjFV9xdk7u9FmcxC/bbq6f4n
         8Jui+5eS0q2FVvFGjZEypgqXdxKQlrJjkEQBBgTRZ+CyIKUo16SnekZ4StSrbaQ4wjFh
         5UcA==
X-Forwarded-Encrypted: i=1; AKwUvBzBYOHMJ9YGwmCyOFNTZp6uJAPkQfvg9TkSKGHpSNC8ydDgpC/v5M1mm8UdUX3rlQJAFvL9gYxhNOML246p5Q==@kernel.org
X-Gm-Message-State: APuU4Z8DolNNJzzHYUpReTd3Pxwmz6l2LQ4Ivqu4pDVB4eOvdL3eUuKG
	vRZqfLmkf8VBBJGxoNdNdi7MRPU+Rlmv7FoxevPCuFtkcmttmhnvkbQWeq09RkulwDrlHRWol1Q
	A7lbr8P8Om8KPYXEDne5PKFKZdaV18AqSD1M7Q+x0NukGxdO68RlYk8pr1KFGNpA=
X-Gm-Gg: AYBFou0iOUK2gKAyZiA0LGUkl1fPtKAv/LvVrwWj05fA5TN/9VGRY49VWGLSlTPb5e0
	T7985PlsT+X8dw0zqbpASje+IaIFjnE4kXLLzTk3Zkz7zOBdicUdzROT+0KkA78zBQ5SozbFbaa
	tyuuqhMuhkTGj4pb8DR/YzvWKf+0B9dJQ8mwBgeLaVlrDoCpvBbAUDjNSfUgvfuiZjolJnHW076
	qBLSvX0sxijyEtZJA2zdPEaTfW13xox7CTkO7XZPt/beTfmueZPr8EKX2e7xfSgd7JgQTmU2Ssa
	fcP7raW7E1FHlOR+yT0o+UEu2BDlAHJ5m5de+5mfUYaTp9O0TM3+W6AokqlkJwwiciOOjm63HL5
	8DEk8WoHDGVd38q3mShZ3hUu51OTtxhpCi2zMGmvPyFX5gEj8Q4wkl7lrN622iKhhq3ZBOxnOEr
	7DoA/SM0q3SDVA/FHUqpoEFGdkiVnxFf/HFV0U5JbJDGetqK6dDwqtg6KMS2ib
X-Received: by 2002:a05:6122:1d4d:b0:5e5:1be6:e12c with SMTP id 71dfb90a1353d-5ec68997250mr7860211e0c.21.1793801332801;
        Wed, 04 Nov 2026 06:08:52 -0800 (PST)
X-Received: by 2002:a05:6122:1d4d:b0:5e5:1be6:e12c with SMTP id 71dfb90a1353d-5ec68997250mr7860169e0c.21.1793801332221;
        Wed, 04 Nov 2026 06:08:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38cf643sm390539e87.70.2026.11.04.06.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:08:51 -0800 (PST)
Date: Wed, 4 Nov 2026 16:08:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "Dreyfuss, Haim" <haim.dreyfuss@intel.com>,
        Linux Wireless <linux-wireless@vger.kernel.org>,
        "Yang, You-Sheng" <vicamo.yang@canonical.com>,
        "Hutchings, Ben" <ben@decadent.org.uk>,
        "kyle@infradead.org" <kyle@infradead.org>,
        "Damary, Guy" <guy.damary@intel.com>
Subject: Re: pull request: iwlwifi firmware update 2026-11-04
Message-ID: <mv4f6j2pmxcdbj2ranjmhgogb7pou2qny6phqg444l455bvmq2@ijma66dusr6r>
References: <IA3PR11MB72131346BF3C1FC358A2344FDAA3682@IA3PR11MB721313.namprd11.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA3PR11MB72131346BF3C1FC358A2344FDAA3682@IA3PR11MB721313.namprd11.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfXwoAhAThCtMn3
 qOxF2v/CjDDkPrCYkuYSsfGC/QMwMUZ/gsB3oycnsob1fCSFNB2Fy/XzVi2vMFNv2Fi0wkoktOh
 Pv3ZOWrA5N9JetYENElKFaY6yL1+hg7QDxIwCgawbt/+dwnUaiX3X/OVw/XYoh/Oz0aeUlXvJQr
 5bgL1HbKgVoQValr/zjOU9/DdGM6jRzwddjLKcd8e0IsBZs8LfPfC0tGh3k8b8JdRvIPRflX9Mn
 Yq66KxeEiKtE6kuzo8TBklY2/17vsSTiD62YIG5Z+F1QxVqJSgApUQJmrVM3U68ZXCnPP0UY+pA
 i8aMzupxzb4ZnL0VO8IuoJ3iZhK919V+GtOT26+uwc3MDgTJB23p4Y5+rx5brn1pJTRDXF8j2Dp
 nyLd/6lE4RollUsPi7wYe3A2Dvm46HkvFYc8gzGJnV1fWQtZieI8pdqm98meKDgMw2xvzSncF9J
 SubXOxAByJ/A+ah821A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfX3sQWfaitPgkM
 waw3eHUOAMk/a3Eu0FFII5xdqSjXj83DWRl+nc38uJsexF5bPTWColWkUoxUJr0IF+hL9L15D0r
 A50tBxCdmE2vhbBD/iqnNYLqb46FPgI=
X-Proofpoint-GUID: cwP5O1stWU0s9AOQ_fsFUYa5e7PlIKxy
X-Proofpoint-ORIG-GUID: cwP5O1stWU0s9AOQ_fsFUYa5e7PlIKxy
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeb3c77 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=dKIYUFIQmK5j6gWxYHwA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040056
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 07:32:41AM +0000, Korenblit, Miriam Rachel wrote:
> Hi,
> 
> This contains a firmwares for SC/SC2 with WH.
> 
> Please pull or let me know if there are any issues.
> 
> Thanks,
> Miri
> ---
> 
> The following changes since commit 02665d2016e1360cd2135998f36cfa303b5be6e1:
> 
>   Merge branch 'main' into 'main' (2026-11-03 05:36:41 +0000)
> 
> are available in the Git repository at:
> 
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2026-11-04
> 
> for you to fetch changes up to 831eb265ef66d3c94f021596b50e832b69b6023c:

lfapply.sh: error: fetched 0f9f4ad5561de009b9656179c11601c3c01230c7 but
the mail asks for 831eb265ef66d3c94f021596b50e832b69b6023c


> 
>   iwlwifi: add Sc2/Wh FW for core24.70-99 release (2026-11-04 09:27:51 +0200)
> 
> ----------------------------------------------------------------
> iwlwifi-fw: 2026-11-04
> 
> ----------------------------------------------------------------
> Miri Korenblit (3):
>       iwlwifi: update Sc/Wh FW for core102
>       iwlwifi: add Sc2/Wh FW for core24.80-41 release
>       iwlwifi: add Sc2/Wh FW for core24.70-99 release
> 
>  WHENCE                                        |  10 +++++++++-
>  intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c102.ucode  | Bin 2214468 -> 2214476 bytes
>  intel/iwlwifi/iwlwifi-sc2-a0-wh-b0-c107.ucode | Bin 0 -> 2268248 bytes
>  intel/iwlwifi/iwlwifi-sc2-a0-wh-b0-c108.ucode | Bin 0 -> 2280432 bytes
>  4 files changed, 9 insertions(+), 1 deletion(-)
>  create mode 100644 intel/iwlwifi/iwlwifi-sc2-a0-wh-b0-c107.ucode
>  create mode 100644 intel/iwlwifi/iwlwifi-sc2-a0-wh-b0-c108.ucode

-- 
With best wishes
Dmitry
