Return-Path: <SRS0=4Hsh=7C=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C5BD3B7E5
	for <linux-firmware@archiver.kernel.org>; Sun, 28 Dec 2025 14:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 058EDC4CEFB; Sun, 28 Dec 2025 14:05:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8ACD8C16AAE
	for <linux-firmware@kernel.org>; Sun, 28 Dec 2025 14:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8ACD8C16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS6AGLc2093358
	for <linux-firmware@kernel.org>; Sun, 28 Dec 2025 14:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ugrvxXR35YW9JUlVvf1+Ke+e
	4pbkY6woYDMu04/14GU=; b=iA5HDRmpgbJVVW9Q3T1+NODje0VRHzw15wA285i+
	Zs0ar4xqa3cOHFpTmMermRCvWz/R7fn/JNoAJnqblOwZY4S/14nxo3NhV7vSwOZk
	OW8TdeGjzdmDQkvxlTOYk+CXJaptOrp2FmuV8k9rzFicopMKQ7MLrCSZRgsys8V1
	RykUrefHkkznZFIj/3GRH/TcPf5M4VRLqoJQoYLFia9ag0F2Ui3yymlSjqEDoNdG
	vvn8tF/aAk1/VBzChl0YaT7vESKOG66VzTSMegmJuHbYoP+nGGdo8wP5nQyKc1Th
	KTCfzoXNRnmZKEeNQMMNXuXYb+aphAOq7VFfbbl8rWQp4Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bt85u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 28 Dec 2025 14:05:08 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94120e0acbdso9323327241.1
        for <linux-firmware@kernel.org>; Sun, 28 Dec 2025 06:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766930707; x=1767535507; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ugrvxXR35YW9JUlVvf1+Ke+e4pbkY6woYDMu04/14GU=;
        b=CpfWEICdQ0fsvnmh+DN2mvB241BXx3DE9sw++0LfItFSlzWreDdSlrg8BF1IqfJwRT
         /sMOINANcHBiggQOCTTqmkz7PsaPGrtWWNABbVmiB2hgN1JVJQJ9q12f/xTt2U5WDnk7
         Ef1qgyylvdwc+mRdmOexrTkIlQYt4KXryl+R2U596/GngDejUa2ComYC42uPGCEzTeJ3
         ldskGLWgHMI525Alfw//Zpilq2t9joC99A9V81cuJwqTCDe97linVY5L3bReAh2sTV/e
         i/OdhgDXtLzth6DVZbdvM+ReAEq80dryH3RqmphaT1aKAXbRIan+/Y13LRHI07Wssk7O
         wtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766930707; x=1767535507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugrvxXR35YW9JUlVvf1+Ke+e4pbkY6woYDMu04/14GU=;
        b=tyeyhTOGtTAfVuaRYnGDeAFFkePpKjvAcrF8M0BJbAzKouZuWD4kDukoMtXlfd1AU3
         Cf/B3SSlasWBes0Qbu4yQu3wmjPcepGR+GJKJWyrOR+hKKSDPhb4/C3JGCfUIa9Iol7X
         c+b5wd8Uo2HOze7wUFlUJK4fBpa5ZwhTK2B1AMZuYjwmsjboeDPmrQSgLZIpsfz63j85
         lqVDSU3twPh9tA27BY4If2HcTfC/YPWzt6INLQ+WNRiJLn584rdFJkCH7vuaxuC3M6pQ
         YccJ0z9rumLGiITNwkQd0l7K3XtGRwYfA7BgfWKZqE3FIdZ1XloYEd5Yc9EZ5QEs/q+n
         QT0A==
X-Forwarded-Encrypted: i=1; AJvYcCWX2Xk9Fdzfo3b91WvZWTnRsUTiu35kpjbwMaOppWFbupxSELiFWAkFXWZNR3xYph+BPQ3klT4nEWS3erd3tw==@kernel.org
X-Gm-Message-State: AOJu0Ywuxbittif1lEHDZ0E9x+R6uh6u7J0WKLakxOFdMALqBL4o4vqx
	wPAKeqHUNB8DCpFyNYDlNywEK4myfrxow/PobmaUqMQh8fNx6vzEDgdI28fdHAF4aJ+8Pvgg+DY
	m0y5gG7iowiUOUocbcEs3OTtgT2G3oJ+yBlGYgbyLgRsmcyzhInQJpHDbvtpA6XE8MB/+Idc=
X-Gm-Gg: AY/fxX4kdvJ4XsMpBv0LBwRJLLlVmiCFzPZtGGSg/9IS3GkX1saHDEeAXaQiT9aSfEa
	LzAq57eAMjU1LqkxjnIJLoouL3hMXbygBpo/vgCdN7+t03yFhfwt8XJd90TF7cdoJ8FedVFUK/A
	t3e8z1nHVMieXwgFN/O42jRNdwGeOomC9msrRs3YbRLpqK+v/nARLXNLfjKsAT3YtjRf579/xTY
	+QB7IplllLtIFVacVVUjqtCC+AuWuUKTUB/6dOdSX+GSA8gartWwjD/l+YCBszjrf5lCF700ewz
	LPpVpjtLUluu9hmE9CGrbiUQ8PPFpnYy5Ijlxt3vLDFYYOAwU7LnAS/VSvxIo4Noiijd2kQmUcb
	E0mrB5yzMu88ozhKiGuj8EV+3rdMda/PnhylVPjCyOxVDtr6KzNfCFRxsSmpg6EvOc0GBNZLiMy
	4A0JtMzbAUTQ+GarNSGI9C504=
X-Received: by 2002:a05:6102:2c14:b0:5db:d60a:6b24 with SMTP id ada2fe7eead31-5eb1a7cdb04mr7039360137.22.1766930706906;
        Sun, 28 Dec 2025 06:05:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpJiqH3Qfc6zG8knsMUNSPkSkwqqlAEEkjhU9eH5LBdZBmZSRUJC7TEC/wb+ZdftiRv/VwQA==
X-Received: by 2002:a05:6102:2c14:b0:5db:d60a:6b24 with SMTP id ada2fe7eead31-5eb1a7cdb04mr7039352137.22.1766930706447;
        Sun, 28 Dec 2025 06:05:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5ef1sm8102267e87.2.2025.12.28.06.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 06:05:04 -0800 (PST)
Date: Sun, 28 Dec 2025 16:05:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Lucien.Jheng" <lucienzx159@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: jwboyer@kernel.org, linux-mediatek@lists.infradead.org,
        linux-firmware@kernel.org, lucien.jheng@airoha.com,
        joseph.lin@airoha.com, albert-al.lee@airoha.com
Subject: Re: [PATCH_v2] linux-firmware: add firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <carcf73gefo65hgsdvvyg5o4grh5tg4a6hxrcn6ejl3ellemii@ryv56s2lbede>
References: <20251225163003.4797-1-lucienzx159@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251225163003.4797-1-lucienzx159@gmail.com>
X-Proofpoint-ORIG-GUID: 9C0S1p7Yti9j3N-u4jbrR1lIdDSNaF_p
X-Proofpoint-GUID: 9C0S1p7Yti9j3N-u4jbrR1lIdDSNaF_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDEyOSBTYWx0ZWRfX805oNKfMcAnO
 DurJdJN4cbguk3ZOn/d2Vk00ghVCnWnygf2Sr6gljSaTtv77XnvtMIp6Z2huyDiUhkkPVWZo6M7
 /WcoBm/X9VMienwLk8il3D8qr10XlNJsy2sQoCefxa2ZnnbWfY/Z+pDL6tl0++jK6/D6AD3HXi+
 Qr6ENd4hxZ41SIpJJM0GGm/z4vhlc80cv6hB2l13pp6IKIrbZA3OhcMj4UcqcSWJVN2WUdYUhIu
 EPnmMpCVXVj34Onbbqa7QYbO5tJZHo1iTmgMt8trbkFVBJyFlx1ERfdo3xS/7+svQ/OsjFwrWF0
 YYr12D4xyH7eI+ZsB9/9TBqhh1uTt6sg6nzkgf+uT7/QMY0Bp04ATcL027B9d6AN0oECuA12WLB
 X52pgZsxxNx3poUFi7CTXb01raCZ8QG2hfRoyZmrPO+1aukIU/TFRtasW5wvTUNa3/OpreDzcIO
 TZOczhg4cXkj5i6zTGQ==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=69513914 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JGXwu8-eAAAA:8 a=o5e4f_8DYfgMdY4lUuEA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280129

On Fri, Dec 26, 2025 at 12:30:03AM +0800, Lucien.Jheng wrote:
> From: "Lucien.Jheng" <lucien.jheng@airoha.com>
> 
> Add binary firmware for an8811hb 2.5G Ethernet PHY
> 
> File: airoha/an8811hb/EthMD32_CRC.DM.bin
> File: airoha/an8811hb/EthMD32_CRC.DSP.bin
> Version: 25110702
> 
> Signed-off-by: Lucien.Jheng <lucien.jheng@airoha.com>
> ---
>  WHENCE                              |  14 ++++++++++++--
>  airoha/an8811hb/EthMD32_CRC.DM.bin  | Bin 0 -> 32768 bytes
>  airoha/an8811hb/EthMD32_CRC.DSP.bin | Bin 0 -> 131072 bytes
>  3 files changed, 12 insertions(+), 2 deletions(-)
>  create mode 100755 airoha/an8811hb/EthMD32_CRC.DM.bin
>  create mode 100755 airoha/an8811hb/EthMD32_CRC.DSP.bin
> 

> 
> diff --git a/airoha/an8811hb/EthMD32_CRC.DM.bin b/airoha/an8811hb/EthMD32_CRC.DM.bin
> new file mode 100755

E: airoha/an8811hb/EthMD32_CRC.DM.bin incorrectly has execute bit
E: airoha/an8811hb/EthMD32_CRC.DSP.bin incorrectly has execute bit

> index 0000000000000000000000000000000000000000..0df4bb8ba5b3f6fe5ea209363625fb53367cf7f9

-- 
With best wishes
Dmitry
