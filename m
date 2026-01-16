Return-Path: <SRS0=2YGT=7V=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52691D47CD0
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Jan 2026 11:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21A98C19423; Fri, 16 Jan 2026 11:29:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7167DC16AAE
	for <linux-firmware@kernel.org>; Fri, 16 Jan 2026 11:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7167DC16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8RkX63192405
	for <linux-firmware@kernel.org>; Fri, 16 Jan 2026 11:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5b71K/7E0fnL+UQC5RQX2eKH
	TgZVP2YbBvuutAQJpVM=; b=W5NZOs3O2DCsO/PC8+pgCrrEL/LgRo//Vyxtf2Ce
	kePE3Wap4k+dgRa6YbxsstFrqbE+17EsXSZsBAK4y1ZN5AHucWl4ia0GGbrt9gP1
	UXF/O0olk54NrNIPnW+yWIbOCBJfLlFKJJ4WTodoItUpJNp0lmaE89KTZC/ghOzM
	56D3SDxGhFgspxQ3vsGwLU3/xGzgrXoc2XCPpxlEx4bxKwStlyAlCZFKo76RKC33
	APYc/dyiEnj6nchPDHHRf6HR+gKIZmbwR/0++Nqg9qPvRdq8x0d8GlB81X2TgCCa
	s9cqA5EQWaAKuyH/Yr7Jiz7xz/5rJrJg1iXL0+bWz/OPJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq968hy6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 16 Jan 2026 11:29:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c530da0691so416158085a.3
        for <linux-firmware@kernel.org>; Fri, 16 Jan 2026 03:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768562974; x=1769167774; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5b71K/7E0fnL+UQC5RQX2eKHTgZVP2YbBvuutAQJpVM=;
        b=bdKnKhzK5BJizPKpOTsDys8D3xlq5TUsc8QQSgsefzJG+I+A0XNAcOX4MGKpTHskW2
         9VmcUjtqLCPS/Asuzlpgx3d+a6ySmeX0lWQaFCp0Uvk8bYaDLAg/iDgxJV42a0xW6tBh
         OazDdzeHgN5pMIo7Io4cV/FXyoPxE1uyMSpDksxROxSdEFjDn4tmwHVDl9T6L1XiCKQ3
         5kSDr/QX/VVPVzmw9VO4VRLG2UOzSRZFhnlT1xvx8j0JANw1FA+ynyMtxMuVX3Av/FLj
         /QW1Q8cdsm3lbtN7dNLkMgQkyqCZVBjkSW9TonQZOXZeuj8SUtQBJ5k36J1vUbimFBLX
         ficg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768562974; x=1769167774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5b71K/7E0fnL+UQC5RQX2eKHTgZVP2YbBvuutAQJpVM=;
        b=VL6mBiUhpp5bGprWKE3V8wFvLboaj4WyPcjYkbuVzj+o6oFpTBXLr0/PjK3GHFThfF
         EujiIxPeOpMmg9KttYWfroi+rXMGYdh7Hz6FD4ZAkoVsn1QWoL9T/lgylIMNOw5TGR6t
         KiCqc1obGGiopsEREWu8KA/3YzXusVR97Ewv2ZwNivCxww7tPrspCtJgRIphulLrDhU6
         W8p+LKtOSAbATqAPA4QV6OUoX9u7+p6xIjXmk+04AcbWtFclSiRB1ioSJYd9sOmJIqGZ
         GSRNZspdKPze0TyounBTmqyRbC3QavwzP7u8E78Cf39f9JoOsEeSv/uUL1RzK4PLn6LT
         e3HA==
X-Gm-Message-State: AOJu0YzkGCQSnxHgBCMBZF7OC7t7Lc3K4YtR4PrrHouRyrEkST4Tz6NU
	ou9TXyGaD5ZFtn3BNA/vSBEmYVumCWYlqG/zqxOCbDEegNfaI7psF0sNTD57dDfgB60QS/ZZtfT
	DOq8Jxieuoym9xzRGBr51VXbMjqHSiYPu3ZUHhOHQZV4QvPW+Yh0JoeIykrn8HV1rUI0a3r0=
X-Gm-Gg: AY/fxX6A1idVFe8vEu+wotI9mZIILJzUPWl4bi3oYO+YqU9UwHhS3xz835RAgZIoVuv
	mQ8hNG7h42pst5VpgluVQ9qNr0q83v9kIVt2IwM30QuVX+fVwHQ5lsvX2Ng6X+ksjABSZs2UUOR
	QIN4xN0Zpg1fQWyrfdsuKU1vOI8WNdJ4DyYIpEazdrFGunaBuq0z2LkKE1a5aycCl6A0c/1c0Pt
	cHbIYiIoOStOo3+7eW2z74+vZVBIxZ9M2OLlHUYyQA3cnX1JV+DdAl8SkhwIpIir7ihro5eT+vv
	UfhWETzz26ZXKZCpPlMtWgireruTxIdjMaKNKUev8Wl5bY6qSHRf3u5xpaBAlw3lzacePLnTABl
	38C5Dw5rnzU9/US/RI3aik5oujV2mv1OBycS35N41JLASCEqqVhJi2EDWVmKR62ntD6uDUmbPWu
	55UJKmIFBbpZvHUeZhkA6AeMI=
X-Received: by 2002:a05:620a:29d3:b0:8b2:e513:6419 with SMTP id af79cd13be357-8c6a693b0d2mr330837885a.48.1768562974384;
        Fri, 16 Jan 2026 03:29:34 -0800 (PST)
X-Received: by 2002:a05:620a:29d3:b0:8b2:e513:6419 with SMTP id af79cd13be357-8c6a693b0d2mr330835385a.48.1768562973964;
        Fri, 16 Jan 2026 03:29:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3a1722sm689546e87.90.2026.01.16.03.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 03:29:33 -0800 (PST)
Date: Fri, 16 Jan 2026 13:29:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org, max.chou@realtek.com,
        alex_lu@realsil.com.cn, kevinchen@realtek.com, kidman@realtek.com
Subject: Re: [PATCH] rtl_bt: Update RTL8852BT/RTL8852BE-VT BT USB FW to
 0x06EB_C65F
Message-ID: <mtkixoxaanomcdf2f4z2yrr7gcnl2lb5pxrnmvfbaqxyuz7qgc@mwugnfxvjk66>
References: <20260116090212.859506-1-hildawu@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116090212.859506-1-hildawu@realtek.com>
X-Authority-Analysis: v=2.4 cv=JNg2csKb c=1 sm=1 tr=0 ts=696a211f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=n9Sqmae0AAAA:8 a=tJ_yeIAKxdWboPqH0voA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: 0a6iQtpYDGCCCxnTltbwS6V1aSNN05Me
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA4MiBTYWx0ZWRfX8m1ko051ZNay
 thxcUi25D6TbPlX7fl1pHEoE+FDebipMvuRWARJLb05go+ApcZnoB35fToMlkaYwbWR7JsauznT
 gSNtQN452r2mTrZz3mYFTqeuTeb5EVjP8FKD3Ulmso5hpEiGuqHs+k2CTY8vS1MAsLFSl9zjY7l
 nQeeTsXphtGMsoaMgmpiINZhhEebrcYTub0EFKRAtk/52YSGfqaqBthbqUJlSoC/9ekb+HazbNz
 pD9QiTkdJRFnKpvdqa1oXvhziQiWjJv+lRxGZs2C+wBp+yx3prayh6c9HP+PYnCLM/mRx9C43/4
 aMQXcLMpSjc9Xer5ndtHlvVeCSW1VEEhMOaw+h8klRBQ3hd/jgkgV2cUM0besRfy7jRyVYKXuZ8
 AxmrPozsU9BU/SzsttqzOI/YNdwilgwJsoo1YnWG0uvKlF/RUaZVhGrwSRt+klw94vQD8n7tesd
 kqurCtgkEmKgV6960ng==
X-Proofpoint-GUID: 0a6iQtpYDGCCCxnTltbwS6V1aSNN05Me
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160082

On Fri, Jan 16, 2026 at 05:02:12PM +0800, Hilda Wu wrote:
> This firmware is submitted for RTL8852BT/RTL8852BE-VT BT USB I/F.
> 
> Release Version: 0x06EB_C65F
> 
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8852btu_fw.bin | Bin 125940 -> 128140 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
> 

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/868

-- 
With best wishes
Dmitry
