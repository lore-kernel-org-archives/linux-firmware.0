Return-Path: <SRS0=F12P=BS=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E092FD8779
	for <linux-firmware@archiver.kernel.org>; Wed, 18 Mar 2026 00:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 131B3C19425; Wed, 18 Mar 2026 00:48:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 175EEC4CEF7
	for <linux-firmware@kernel.org>; Wed, 18 Mar 2026 00:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 175EEC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJb603164988
	for <linux-firmware@kernel.org>; Wed, 18 Mar 2026 00:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k3lWVrTijV4oJdEx135NMWqA
	INmXCXipQyZ8o+HtwWw=; b=k+66UqJf0Xq/TSnrx6t+AjwuEdUAQvypezrVb/gA
	U2Sn6RsbJfHSKN8zeaj3R4QA74nVxsYgP8NcfgQOeZjSxmnPshxOdiBD4DdfaNey
	nPWA6s/zOUcy1BE5f7Y1mYiOKkggPDtfuMnUb+6PFRkwPgwpuG1nCyxY1Y9Ye+DN
	qX/IlTg2YBhOi3xjrVS2mUcdh5WX8JzEHUvvjnWXfVA9IZfFRb+8PRIFAiFmMP0k
	yCDfQplJoRv8CeQPDFk1GfCCJFBcJVL/v7rDu4ezEWcvTD+90fm0qOwbk4ikHIWw
	ibLNhPjVSuK91+PEdEJt3Q+9zx5dgVZfJXUf3sjsR3MaOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy4v6u1fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 18 Mar 2026 00:48:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7774be64so3729855885a.0
        for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 17:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773794920; x=1774399720; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k3lWVrTijV4oJdEx135NMWqAINmXCXipQyZ8o+HtwWw=;
        b=Hq3/VWJDMTrtbeRw9moWP4Xeeo6Q06uPt2uCXFpBAk8/ryXSTvWVVDuapSTUvEdYYR
         T3f7FrU54CPRW3f6GG1RpViPrpyrJ65ExLdGSlw2IEAUdyXZi4U35x2rJ/8QxguxcmD9
         sCqmpCJK4gkr5/XdSY17LEYhO49rEf2jIsjuS9ZmpohQV1gZPpdpMIj2kSt+b/WFtw6y
         ooO6jwqnuPHCUAMER1u2oiJpV423TRIIvt9foZkSNp1eTFQdJZMKp1t81Z934tCPLx+y
         uKi3HFygzU6eMJyhq8QCasDcvaf88J0WEMLJo2gDlSBQUOj6Jmmuue2Nhw67zyISqDqq
         euXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773794920; x=1774399720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3lWVrTijV4oJdEx135NMWqAINmXCXipQyZ8o+HtwWw=;
        b=T2jTSNV3jA/2pD1X3EzXSZK16ZLwOzKoGirfN42eqycCOZXz0vgUL0fr1kjaNNh5RN
         s29xJa+LT+ehDNQBmM3ZoVwTGfnDcnEXtu8kBY4/dNUXfVTBk46m/kuAeaV2rShIb3KI
         2Lz99QiwJlRpKDQeQlFdi/XxGV2egfBA3bZE2XJZ798JeMdUOcgi9W8ctRxkdyEzc1c5
         mdqVx/+UYqfTX2lAxcK3pGbw0YPvMJ3NI+LMAfIQU4zJUE5BiN22+A9KDfCN0pPuv52a
         vsgCMtcalHAbDXZagWe9ElmVZ25C1qe2M0sLAAiBuc4LVot6cG9SSe/wZ2hT1jx6sGwd
         tA5g==
X-Gm-Message-State: AOJu0YzFYn7/P0wFZJprijffbSoB830X7DB0WfbWybmZ/Dtk2rvB74H6
	wlYg3Z+gJPe/8+Lu6zyU+aLJRr6UikrFTGKNdR59cDrHmErGHcYTM1swrRRW7ZOljXmMFdD8oxD
	+v3PsEdvtcBc0kC2P/8RHIKR14Cyvi/T7N9daLuR2IScy+7SMEClcKOnidfvFYk8=
X-Gm-Gg: ATEYQzzkpEkaryucSMwL/+GteOFkY2VqhpyArOZUqj1Z41rjwc7pnscDzXjz6rpQlgn
	jpGLuZHpPTGG7dtRy42kMlNGLSOUaT/BJc4dxMlnW5xAC9Fpo7CO3ypuL2CZKiuQqZxXHwam9cF
	aRLv9w2FymDd5xcdKHVjgDKMf4CFdFk3tFzc4X7xm+vZBWpjQtFEM2l8siyVqOmUGfmH3aXEiWr
	q3n20USfFi90SOXpYKxpdpeqIvU5UuzwFmFqBGnbqfJCe6juAL48oMYPgL9lA0BFEDNdsvqG/Mj
	xna3z5Qkq19Ws4oHyjBxmwL1a2kQVZ7F5Ki2rlEORZxvwZn2M/Hyp100DErXA/+0Eqeh/fxtWPD
	hClj+x7MB0cck6Tinv4kf3GLh2TRT8d3oVxmA0GeCh7RnI/tClUPTuZjntuIvRL+9zJVTgQRlyn
	ZVNBPDqweMXqFdhgT7h7b8g0Kwb3GefhfwzrQ=
X-Received: by 2002:a05:620a:1788:b0:8cb:baea:89cd with SMTP id af79cd13be357-8cfad1fe3famr246652985a.8.1773794920087;
        Tue, 17 Mar 2026 17:48:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1788:b0:8cb:baea:89cd with SMTP id af79cd13be357-8cfad1fe3famr246649585a.8.1773794919600;
        Tue, 17 Mar 2026 17:48:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a27a987d19sm75687e87.73.2026.03.17.17.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 17:48:37 -0700 (PDT)
Date: Wed, 18 Mar 2026 02:48:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "kyle@infradead.org" <kyle@infradead.org>,
        Josh Boyer <jwboyer@kernel.org>,
        "Hutchings, Ben" <ben@decadent.org.uk>,
        "Dreyfuss, Haim" <haim.dreyfuss@intel.com>,
        "Yang, You-Sheng" <vicamo.yang@canonical.com>,
        Linux Wireless <linux-wireless@vger.kernel.org>
Subject: Re: pull request: iwlwifi firmware update 2026-03-17
Message-ID: <6dvmhm3g4nt3b2s3ecy2p5tbnbo467w7curmzorrkooaz5tait@b55n5sh4o3nt>
References: <DM3PPF63A6024A96E4ADFF6BC9FB4AAB041A341A@DM3PPF63A6024A9.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3PPF63A6024A96E4ADFF6BC9FB4AAB041A341A@DM3PPF63A6024A9.namprd11.prod.outlook.com>
X-Proofpoint-ORIG-GUID: 2k86NUERKhgiDdcfIDpTGlzypJwdg1V0
X-Authority-Analysis: v=2.4 cv=Aa683nXG c=1 sm=1 tr=0 ts=69b9f669 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=p0WdMEafAAAA:8
 a=VwQbUJbxAAAA:8 a=1fbsq9cPcyC_cF291j4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 2k86NUERKhgiDdcfIDpTGlzypJwdg1V0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAwNCBTYWx0ZWRfXwjPPlaQV3M+M
 rfECV7dNuaJJE89/i95cj79mJhqcsCGD3Tj1IqyA6nLPSpp9A20HwFUtWYCMPpLn8C4huv7kEzc
 SdxXHqeFiYrjUmVcjMWNDRpxclfLBZ+hzd6yhstW029fIldVs9pzgEss0JYm/IZHKZcKgcxdh79
 RdfTIQ8++Mt0Cq+mcDsEuZig3S25eKzIPfSkcT/RlUSc+YW+7Wp0/jpPHXqkugTMnX/FYYrqjon
 amg+ZSoF0p0nhxFeQUWf9mq/VtAObEGQ7pG/pR5q4TmH5Y8KooawfDEXS5LhTxksRDX5qay6Pip
 V2kQtwxdSTIPgr9lSuMGBMtp4lI6ShT4aySw2N9ON5IVUILV00Pqfp/jYYlUfPYFHeEiDy5I6qM
 rPlKBQfmzVSuCR0HPE+dkwguGSw/kHJO3dlcrWDT7nlkfJl0Hww4NilKbtCTNRDd8e2JPD15APX
 7ZvcCMcSaF/Ek+XRORA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180004

On Tue, Mar 17, 2026 at 09:21:11PM +0000, Korenblit, Miriam Rachel wrote:
> Hi,
> 
> This contains the firmware of core102 for Bz/Wh.
> This was missing in the core102 release.
> 
> Please pull or let me know if there are any issues.

Merged, thank you!
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/963

> 
> Thanks,
> Miri
> ---
> 
> The following changes since commit 81f761d1b5fd51469d87d1633a959dbff4785f58:
> 
>   Merge branch 'mt792x-bt' into 'main' (2026-03-17 17:33:37 +0000)
> 
> are available in the Git repository at:
> 
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2026-03-17
> 
> for you to fetch changes up to abcbad3cc9588bc6e2f410b5984642c9cd46520b:
> 
>   iwlwifi: add Bz/Wh FW for core102-56 release (2026-03-17 23:14:14 +0200)
> 
> ----------------------------------------------------------------
> Release Bz/Wh of Core102
> 
> jenkins-Core_manual_signed_core102-56
> 
> ----------------------------------------------------------------
> Miri Korenblit (1):
>       iwlwifi: add Bz/Wh FW for core102-56 release
> 
>  WHENCE                                       |   4 ++++
>  intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c102.ucode | Bin 0 -> 2116884 bytes
>  2 files changed, 4 insertions(+)
>  create mode 100644 intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c102.ucode

-- 
With best wishes
Dmitry
