Return-Path: <SRS0=p/JV=7Y=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBE3D4A5F4
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Jan 2026 07:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 789A2C19425; Mon, 19 Jan 2026 07:42:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F20BC116C6
	for <linux-firmware@kernel.org>; Mon, 19 Jan 2026 07:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F20BC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IMrmeL613578
	for <linux-firmware@kernel.org>; Mon, 19 Jan 2026 07:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y6l0LWL7wACGdBi9bOHrGQqS
	n2ahnUwbZBs4QuWBHvw=; b=FvzMrArUyx2f9vJEQCiS19NjRavKmlRTkPsI2yc5
	xktOEWqmihjoaM65QQUohAxVQCPLbHmRuzWawJegXFgd0yDysEVzi6BBJ9rZ1Xwt
	K+zC/C67GOT7s5nSrBD6J/Y18dUQ4NYsMScUGjqW8XkpfKlBBS8TqEWtVpgIxy2Q
	8bEIsBRlXiTsLg6rl6rT+nce/eGm9E5QSaU5M6WKHu1iANel9+ZRvVI8keuVAenj
	3mFmJg7RlkpYJwvE6wSCzwzW5YdnshtaOY3wKwGvHmbQab5ZL4bLc3gXmQG2ZNcs
	cqMT0+CelHh24zNt4ttHvyNDyPpEFTf4PvNs3XHMPXpeCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1e5marh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 19 Jan 2026 07:42:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52fd47227so734057285a.2
        for <linux-firmware@kernel.org>; Sun, 18 Jan 2026 23:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768808570; x=1769413370; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y6l0LWL7wACGdBi9bOHrGQqSn2ahnUwbZBs4QuWBHvw=;
        b=N3sDLHU15YoBflfxxPh5gjBUi/P4ozgX1VNFJxS/WTYGdNI0jo3HYTqImRkRlNd+rf
         VduAUIhH3JZbKWb+Mjg7woDdQ3QjoTtLL/01w10PnmNs5XlIqAv69Q7UiFtFKV0nbMbN
         d+U7ROvVPPFqNfTulGk+1ZVCSuCh6O8K4eUJoFcLGCUCQ8J9y4Q2DZXtnIS0WnJSOPlH
         iCjZz16Os8Us+GXEUu1sjPx95rpRMvLBxhLqAiP4FrQLsEK/tbeUjRsyEyf9G9HQewu9
         4DqMM62y+nMsfLe8alB/SVq1/FaHDOffPw/tQzOxp1E+ltksD+3fZwPA2adlAsYyNsMh
         hCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808570; x=1769413370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6l0LWL7wACGdBi9bOHrGQqSn2ahnUwbZBs4QuWBHvw=;
        b=qKMOmI/H35l74K9gkBpsrkVnOxJA2gv0csg2EYyILm/0oDPjQfH/4i0aRaiSWeJ1Dl
         Z2JQk2chsQopE4KIOqIjIUcrOB0MWVrcJfOuDBLWFuMO9oGq9yEigN5KaTvVMtqH0Fbt
         2MHqFLKA/8jJ9ed9J8Qq5HZsxTIgZ84pQgX2CBlTr0bMHvv4B3eRUnktBKY7OthV1s8p
         KhUfp/L07JwgKZVZ4xn/22bkHNSAnnpzGRtPWl5cZb0EIKorHY3isS5GeHhnXw0UPrsJ
         JW6REiCBfJQeE7MSUNSpBwrSZh+WqUeRBGhGo8Tyq/yLeMimcQWpTsaiX264Dc0WUpuJ
         zWDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfVeUIYv03GVyH6zAXqGjxPHRRJdebfUsspU0Y4JiZF8rH3zHotKgKKgLspjxqGzxqhBSplupjkLFdLV5wfg==@kernel.org
X-Gm-Message-State: AOJu0YxuqwOCuwVWftzaFjXvZjU+GJSozauyUyRMbkPZu/p9Y8PdKMRl
	j6FDOmjf8ZLr142XorfcxDzhZ9M39/2tVBhUcIUFgU5PzWfHNIX/mbByisu+p7AusWL3UJYJumS
	LTiffESWizNaLVmm2tE90LnJyV8SvrhFKHl/ad2dXJW5DEwmC7xnc+sV01Wv2sJU=
X-Gm-Gg: AZuq6aJ7X69bgV8AWbwknsPBi0gV4zSsnAkhKQk+2UM6WD2XVpbT+3fpNutEKd8Rt7X
	VPH4s8dOgw5FfNXRogYBifywui+14oseRK6fKd4pi3KMloqrSsQdDKfIETIsFrZ+fw6jONmm5Ri
	UcEnJmHqygGVM4ezvuvPpQYZoAB5mMA5juMl4AF3jxzSyLMtwQatcntZ45eBLeNzYmI/q9My+CF
	XE28zKQu26AfkMeAzkUVDNC17XfUu6E1Cqcj0oLa7NogIjpkmOUXnb34pbkpP4n2KODKwTBpUm1
	MgBdKi3Hkr5qZmivA+Ui7V6QP1Qc1appyxzw6/Sa2Kx8urUGfp7EkSmLWVgnyZDXpxzS8SCAdgE
	EWfhLGCkgxXvQwSYopGsqd8YmQjNglj8Kk1jbPp464AxnZR03FpL5DGDuZA4GrPtx1P1RH1F+15
	gHTbtbwYLexjJYWlOuEkzWhW4=
X-Received: by 2002:a05:6214:1c87:b0:882:79dc:71a with SMTP id 6a1803df08f44-8942e4a65ebmr173739196d6.46.1768808570491;
        Sun, 18 Jan 2026 23:42:50 -0800 (PST)
X-Received: by 2002:a05:6214:1c87:b0:882:79dc:71a with SMTP id 6a1803df08f44-8942e4a65ebmr173738926d6.46.1768808570051;
        Sun, 18 Jan 2026 23:42:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm3138500e87.66.2026.01.18.23.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:42:49 -0800 (PST)
Date: Mon, 19 Jan 2026 09:42:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Allan Wang <allan.wang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: jwboyer@kernel.org, dwmw2@infradead.org, ben@decadent.org.uk,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>,
        Soul Huang <Soul.Huang@mediatek.com>,
        Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
        Robin Chiu <robin.chiu@mediatek.com>, Deren Wu <deren.wu@mediatek.com>,
        Michael Lo <michael.lo@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
        Jack Kao <jack.kao@mediatek.com>, Chris Lu <chris.lu@mediatek.com>,
        Sarick Jiang <sarick.jiang@mediatek.com>,
        linux-firmware <linux-firmware@kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] linux-firmware: update firmware for MT7921 WiFi device
Message-ID: <3sdwtf5qj3svipxcnmj43qnmerv6ouxnonmn4r5s7am3ebykz2@yqxwrosjcnvs>
References: <20260119063300.2741850-1-allan.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119063300.2741850-1-allan.wang@mediatek.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2MiBTYWx0ZWRfX/SJ2AXXju4hq
 d+naJE1Zx7P/tFrVQbUpmEQRO/3bec38J7/tmgziEjDP8hFLXprTN0ctqq1CnuuOh4NL7gCQSsD
 Flk6UgcNVbzn6e6xA5t3nz696Gutkrs5283IamqL1f1FPegnBLjubaB+hkHkHCwZ42kT3tOFB9h
 25LbGuvI3DUNr+EmCyFAPos6C//sdTxpQLGNrBcUWBqKDbfN+igmPx4D4tg57as+naiHam++Kka
 LSMPQez4C6fygXa8PMWF/MevpKtNK4kKyjC1ta+PWpmzTUP+4FUDX00vDqOckK/dOQLdeTHzxhS
 jvUZHx8U8L/B7ZUGn08/GexRW9n243UWoLUaXjOXpOeJ574ei6PeUczLB5ueoq87cAFQp5E3Dlk
 GN4bg+V5a5C4L23ZngdH2uQI1xYqvRxTtEQffnwaPqENTyYYz1057kAMsyCeXki7yAWzZcNVtrE
 moRRo8qUsbeCq7IVolA==
X-Proofpoint-GUID: TTOAt437Go-tjaFSCiiABfueBvLTx5Eu
X-Authority-Analysis: v=2.4 cv=U5yfzOru c=1 sm=1 tr=0 ts=696de07b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=mpaa-ttXAAAA:8 a=BbqIKv7TG13PCbykag0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: TTOAt437Go-tjaFSCiiABfueBvLTx5Eu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190062

On Mon, Jan 19, 2026 at 02:33:00PM +0800, Allan Wang wrote:
> Update binary firmware for MT7921 WiFi devices
> 
> File: mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
> Version: 20251223091050a
> File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
> Version: 20251223091148
> 
> Signed-off-by: Allan Wang <allan.wang@mediatek.com>
> ---
>  WHENCE                                     |   4 ++--
>  mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin | Bin 92192 -> 92192 bytes
>  mediatek/WIFI_RAM_CODE_MT7961_1.bin        | Bin 791588 -> 791908 bytes
>  3 files changed, 2 insertions(+), 2 deletions(-)
> 

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/871

-- 
With best wishes
Dmitry
