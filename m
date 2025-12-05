Return-Path: <SRS0=8HId=6L=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA1FD339AE
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Dec 2025 18:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15C00C116D0; Fri,  5 Dec 2025 18:32:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E022C4CEF1
	for <linux-firmware@kernel.org>; Fri,  5 Dec 2025 18:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0E022C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBLm61342287
	for <linux-firmware@kernel.org>; Fri, 5 Dec 2025 18:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EsAN77b5jlhTs52JfrYgOkM2
	xokQh050KDwqvxtezf4=; b=OxLv868mO/YqXAp+QmHwTnhQaTowfZihrImLFYR+
	b8Z8x/ewGBmOZGkUHHGSsA2CcvndMtvDHXTHB1letNOVkH4RvdlzyUmjol9qAsQ3
	CmFj4x+MsfyIOsCseUQSWIbyDRfdGE1HsGV+9xXUvQNwW0blpwcZ52E1AGe5c189
	M7yZBwT3h75IUmXS8sYqV4yz+hrCrbkvQ91767ePR2faSojIhg8WozMbc+/LN/Nz
	5iwmK/MLj8rS4Sad74bcoNSAbc0qxueQnnsF2c64IZnCauNPBLuwLcRVr1b1GtQ3
	Mwa3qfajp6tIWTJMN4UONvzP+tBhlu127Cy6KOBCuAV+Yw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aur9atauc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 05 Dec 2025 18:32:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b6963d163eso93892485a.3
        for <linux-firmware@kernel.org>; Fri, 05 Dec 2025 10:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764959567; x=1765564367; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EsAN77b5jlhTs52JfrYgOkM2xokQh050KDwqvxtezf4=;
        b=ULllKlf8JImhsrlcCcNZ9eaMssaZCQ7nqTiywRBW3J34xFmFhEEIuo9ds9O2epUsXa
         h5O+OhUOr0rl7i6PYsrZipmqa6RnmnRn2Va8ZaUC0oz/XWEt6Loxx37SBjZjORrixV0B
         4kwC8TkPe5K5Na5jcY8QIcF3+VPSS/hPwG1puO8Diw1NoqRZzV+ZPYC3BcSlsQ5NdPnL
         ovEf4vBbeMO5A99IoS/nggSUYs8DF8zYi6OxhDA7rn7zeS0j+OX1k0ay1BGfdxkgP7cq
         xXJ6CMtwHE6IdUewam8apCl961WVfva4GFc8mVrKLZx/IcEf1rQEWMjJVJ+RDtjrVPOM
         0s/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959567; x=1765564367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsAN77b5jlhTs52JfrYgOkM2xokQh050KDwqvxtezf4=;
        b=UismUw94fdbkc55cBtISp8UoZR4GnIJ9+xVHLVftAHP6dUEzBTW+SZTvI581h/1UPs
         dexmvlLX0Ohzgul552/nn7GVe/wHwKWTv5zpywdUk25dKjQhaSP0ycEh6KzZUApHvFMc
         h4VsKeX+yEsnkerarDHPzAEQNZVpIb4xabhmlbvgpTkp8brwVVYCoB8BbNSICXMpBeG4
         nqm3yKOpF59P5fscvmgxCxS2OYORew48KjtRArXSMDgBddYjd4ANiAJg2EugohtVPfNe
         +wbsjs2lgZpsG1YTq4RmcB1q3HhzjiM/k6EtXFcdnefqRpfpdbDZCTyJK49uVzewlJ+C
         keIw==
X-Gm-Message-State: AOJu0YxYJ6jxlT/821f/C357w990LxJz++b0dG+fRDkhgdikq/1/CJxC
	UQqn0Yp7v7n44WTbjXUh6RtWSQURn2LbsRBlPd+MIaT8gukrBJFsLvIps0smzDNa4dA0H3EEJbp
	U3FIRslaRt58uVqwT8XDyx0/x5jAgHggdo26QJ6KIBhw3QdZo53E5kIlisBRpDC4=
X-Gm-Gg: ASbGncuV0ryHyJnNmH1AP7L5GLZ6Rc+rfg9SRyQ4QKAMhlLeBTdlQ8zBZg6g9oSYrjC
	QwH5kBo7nMGsVf44FAEowsC3w29nhxwptn0U++i9j7mcEl2DDONFZX77MT/KqvpGLAxqA41Gu8P
	ftTqpZyOCdidxqtJvTq7AuCVz30ECVjCEPDWtz+B13u0qtQ7YrpLe2og3MlP+zvWMtOws9YIaAm
	TZ96LtrPke8bRrABLKcRcx+VwB/mZ5lTrODpYEGdZDheaLuDURvCYA2+fa2buKIdifGWIN5BvAQ
	YFZOmL/60UZq0tCIDt2+m/4Ustf2lbGMiFE+w9/k5LClu7/+ekucsE3t68BkgJTDR9wY5clBf4/
	KpaZoY7DEUQrK9D25t8cKKm3urbfbCI94Heu2zJyOoJITuhk1SyU6LHQ+AG0JJn+lj0D7f6L4/a
	jrgnbo0RUUs8oJS2dMaaUa840=
X-Received: by 2002:a05:620a:4095:b0:8b2:5df1:9341 with SMTP id af79cd13be357-8b5e7451b33mr1656360585a.75.1764959566962;
        Fri, 05 Dec 2025 10:32:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF083DzGWn2LEo8Ae9UWqRNGaIZu8Bc7SHuw0in/lgRyW4AhyA5NMTa/wtyUxLpleFgvwoOSg==
X-Received: by 2002:a05:620a:4095:b0:8b2:5df1:9341 with SMTP id af79cd13be357-8b5e7451b33mr1656356285a.75.1764959566491;
        Fri, 05 Dec 2025 10:32:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c27f0asm1710142e87.74.2025.12.05.10.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:32:45 -0800 (PST)
Date: Fri, 5 Dec 2025 20:32:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20251205
Message-ID: <ggvvbyrdqvbjjf5kxvnzswwpkzsbnnjc5hsw37qreyrekheoze@p4iavaks7rmr>
References: <f4e1e95f-672d-418c-9f3a-e47d01a1fe91@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4e1e95f-672d-418c-9f3a-e47d01a1fe91@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69332550 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=BankifvHBk-6wX3BIUYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: KBIgrDIHzWGo2Q72Uba9SK1tp2BFIyiK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEzNyBTYWx0ZWRfX2UDJeWxsD5rx
 pMZVJymuFPo7DOCNgfoFIZj0kuLyWnzCTZFGOWI2/6R1UDOhIURLB9Y8yeR+YXYgv+f++cpYPV8
 dwjz2Ad1cxtDYh7J/arAhAgQjKVv7z9+Ogge1HM0uvMM5qyWtoBp6Km0cKBSZ0RqTfLR/538niG
 TbeBUIAMCRqPczaWXymH42i/dFo/4nHwdotHj2Zu+qx2rkyVMD1spNEF4l1+KFbM5DhyD22+PVh
 heaQ7u0s3D0khSvvyVQNFg3Yd/J4wGyHfHwCMoemQD9dUBxGg37dWqmwqp/UCjIh7/2dpX8Zr5j
 DzHdY29zQHWCE+fApXSyfhHGHt6uAxcAKXezLt/WVSV7jLCgqSGPkCaFP62UuBpfDs3WAQiYgYz
 oadfqTEUIwt37vlps8stxdpNOW39fQ==
X-Proofpoint-ORIG-GUID: KBIgrDIHzWGo2Q72Uba9SK1tp2BFIyiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050137

On Fri, Dec 05, 2025 at 08:30:02AM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> Only ath10k board files are included this cycle:
> QCA4019 hw1.0: Add Netgear LBR20 specific BDFs
> QCA4019 hw1.0: Add Meraki MR30H specific BDFs
> QCA4019 hw1.0: Add Meraki "underdog" specific BDFs
> QCA9888 hw2.0: Add Netgear LBR20 specific BDFs
> WCN3990 hw1.0: Add board file for the Arduino Imola (UNO-Q)
> WCN3990 hw1.0: Add Xiaomi Redmi K20 Pro/ Xiaomi Mi 9T Pro specific BDFs
> WCN3990 hw1.0: Add board file for Huawei MateBook E 2019
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/819

> Thanks,
> /jeff
> 
> The following changes since commit a0f0e52138e5f77fb0f358ff952447623ae0a7c4:
> 
>   Merge branch 'amd-staging' into 'main' (2025-12-03 21:05:40 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251205
> 
> for you to fetch changes up to 05c97f71a5336854054db1dd4acdaf68c5b7c144:
> 
>   ath10k: WCN3990 hw1.0: update board-2.bin (2025-12-05 08:20:14 -0800)
> 
> ----------------------------------------------------------------
> Jeff Johnson (3):
>       ath10k: QCA4019 hw1.0: update board-2.bin
>       ath10k: QCA9888 hw2.0: update board-2.bin
>       ath10k: WCN3990 hw1.0: update board-2.bin
> 
>  ath10k/QCA4019/hw1.0/board-2.bin | Bin 1822336 -> 1895232 bytes
>  ath10k/QCA9888/hw2.0/board-2.bin | Bin 218596 -> 230744 bytes
>  ath10k/WCN3990/hw1.0/board-2.bin | Bin 670116 -> 742192 bytes
>  3 files changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry
