Return-Path: <SRS0=NWYS=7K=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484DECD0425
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Jan 2026 23:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11414C16AAE; Mon,  5 Jan 2026 23:32:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2AB96C19422
	for <linux-firmware@kernel.org>; Mon,  5 Jan 2026 23:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2AB96C19422
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605JEIYh3541656
	for <linux-firmware@kernel.org>; Mon, 5 Jan 2026 23:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VjT+IN+3pB6OLoL0p6vIodrx
	L3i5GGS/wibQF1H0K48=; b=I+ccXijFTZFkr5CZpf6ZBRHyY9M34tTXipP8+DY/
	VF66qu7jLqcMQhkH2oOdcOBGsQ7wuuHVBvrlHvXscx8ZcuNupf+cMFa9kzsRlhXl
	NwL21MlzQRBsuV0GLqnfG+MVXaYIVCvWYsCqM9YnnqX1uSvZFwdG4YZyqmSe9sMo
	xE00cHjlwcN09Rd3sQ8l2tTmnDli7Ckqz7VvP6ZTtOQj0Zp7mtv9/CxsAeGdZnpe
	VNwrcnJjYfl0+tl1stzmToKf/f/Sl7JnhaPL9002Btyz+ZqVNCpl8MPAv5OW9YJ6
	NgLs3YdOuWw3rRO0p21PNILpxzAp1BDTfWkEwkvrNBikuQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57sk781-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 05 Jan 2026 23:32:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee3dfe072dso9396651cf.2
        for <linux-firmware@kernel.org>; Mon, 05 Jan 2026 15:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767655931; x=1768260731; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VjT+IN+3pB6OLoL0p6vIodrxL3i5GGS/wibQF1H0K48=;
        b=UxrgLSqri6FO3wCkv2b8ZXdD5uTxG0yKNoWhQcmxptMpAB0+tdIv6ltJVK6q0UAvb8
         j/xux2DTra8oxc0cpaBBtv+QuMHcyKw2nkxmlbmGmi0cyXfTVz/3gPgMJKiY4FHZrqyw
         duRI/aidtrPmONvunKk52rGJApZnLXZLxYnxLNHi9MQC7hMrCo/9h7fBzdq1F9Wt00w8
         q2FDYtMm3HbbYXJckhwBlBOUKJYXe0Q4qePZIuXLutfLT8W8TWYpRZYsPPuLCDhcTURb
         ja1ff/112EhPzyoVq+hV0SGn2saFcTFtmXM9Jn1ltCy5oVFHZ+ItAiMMeLZREL2dOe7U
         m9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767655931; x=1768260731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjT+IN+3pB6OLoL0p6vIodrxL3i5GGS/wibQF1H0K48=;
        b=cVofgo3si7dyLgapr4bMLB7QfkDVr9o0PsbBkBLusBXUtQ2lVZd9DAR6NprLJLHjBj
         2pEx507YeBWK03vU9ketHQB4XwzzuIoR+yvDR7SVbYCliXDCpOwLf15pqe1m9xFXhlrW
         s2LL3YMD5dsUPOsqeAsAZqKjhwWt4yxoBJMCzFtp1tbTXhZ4zvhjutlO3JrTvgA6OyP/
         nZzDwIMtk6bWUXD/nDI0rIhgMlplfph7rhIugGo3kXrds4ZaF2Wpz2JfDYFiokhVXJ73
         mVw2jBKjJG/AE+GA2ezFFqngEWTBWN85C6SWwEo0C4AQHoVuzzZwRaQb1rqNpeLF1NG6
         M6YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUYWt05Sm2M4hw9enavIYPksAzV1HjIdhtrhO/JoP1QN28VWxYywWNRcXuq4L6pp/9/TIO8suDWfzxUZON3Q==@kernel.org
X-Gm-Message-State: AOJu0YyRxdDCTPFeJTOGGs/u7D2XOPm+XiUzy9iiSIQF6mB8CHuMuhHm
	KSo1dnhff6i+EabyVgfMICVl9IMqYJVgOL/naegpGC8T+27BcBGese14zYyLTCu1WoMcFNZk9km
	xRE2azhXo2gVxZEh31MamXclCl4DI6hNiMRc7ePPijY0XwnAjW92Aq3uYZBGigVX6J2xn6OE=
X-Gm-Gg: AY/fxX4/VS5lmeTD7HAXKc3l+686JhooyoVaUbsW4IgVYnfQ7Z2+YE7B9nbH5Mo4Gve
	tJ/Vm5hkH9PqF3t/YFLu6yDP4PaQ/4iYEX2vuJ9NrVwuPzoFpTpIo7rAhY0SNnTLVDPDJHv3sLM
	FWrLhTSwMMdQAeTD7idOsmKBqjjSvZSj8muhEmsYnC/2e0qR89t7SS9S3ZcOcJ03T42CXlGOgfY
	TRUK4wu56c8lbbdlwjFDwdDamagUFeB9c6J2IdqP5eO1URE71HibQTzf3LqbnAGwHMJUG+e2SPU
	0wqNC9tiBBe9Lh3m1dfa/A1HnCeTF6/jAtL8tONK1s8PGEBeiW69LSOUFAZ5iwKfhos/oeqK+Tx
	tJ2owsY4H1WbHI6Fytf9iKAbLBwQke4fYX8Ml6wD3Qkvp497VxPDmhTrr7DXESrawbuhDsTxp+o
	zVqAWDd+QKNlj4VFe50IvgZlA=
X-Received: by 2002:a05:622a:598e:b0:4ed:6e70:1ac4 with SMTP id d75a77b69052e-4ffa77a8178mr16608051cf.42.1767655930851;
        Mon, 05 Jan 2026 15:32:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgU13geSlASOkvIKxaVQuYqXGDI6LU/M3qnDNPH7tiNMewPmKEhrFineg8VxZBr5wyBzKx2w==
X-Received: by 2002:a05:622a:598e:b0:4ed:6e70:1ac4 with SMTP id d75a77b69052e-4ffa77a8178mr16607811cf.42.1767655930350;
        Mon, 05 Jan 2026 15:32:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65ceb9aasm139380e87.4.2026.01.05.15.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 15:32:09 -0800 (PST)
Date: Tue, 6 Jan 2026 01:32:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Lucien.Jheng" <lucienzx159@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: jwboyer@kernel.org, linux-mediatek@lists.infradead.org,
        linux-firmware@kernel.org, lucien.jheng@airoha.com,
        joseph.lin@airoha.com, albert-al.lee@airoha.com
Subject: Re: [PATCH_v3] linux-firmware: add firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <d6q6sxlltho6viwuh5icywxea6xayyy3fjoxexbre3jym3zyum@b3kw2ebjahq5>
References: <20251229150411.2862-1-lucienzx159@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229150411.2862-1-lucienzx159@gmail.com>
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695c49fc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=JGXwu8-eAAAA:8 a=dqLlDCLHrhP2iWWqnqoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDIwMyBTYWx0ZWRfX6RDSb/b6XKBI
 hXvUOFYq9arWyRcZSfPLV9UoUc2Arw/F6rxPtNEIrbSCjnqiwvoF0ALs3bYNb3kDfMUP/ABM2ZT
 +1FOCpzpWaB21iRPUcWa2p4RblOpEUewK34iGBo9QzVLRAs2Hqff6bQ2xJCxwKta43apAbcxnC8
 RnwdOMwf/B12whuvY7y/xvGNKRThNCgsjBQq8UiS7xyYAPxvK1llAN091AWCzg5MVv3gd0JI6qJ
 r83Gt+9rXJ0Q6SNO38KApOlXiUZbonZ2Vu7Zx1Rk91/V5VlBVoPDKuIn7Ah0saLllrCBmkX/4r2
 DQN0KllU1scY0Zzcfn7KTBfBXwDsU5FgMp7I3PsN+dTJejJLa89idHPZZkQNT/evuFhx9T1LxuB
 ImVVWWNS4Ca97EWPr+ptMfLDPQEQ+hOcNjXcVCNj+m7gczgcibHIQi9vcADkP2wvD05fFoqFeE0
 5ESxocOuNJaJEshOAlA==
X-Proofpoint-ORIG-GUID: LQK9qXavNl3Vt2fz9Pk6AjNwAqoqt-0P
X-Proofpoint-GUID: LQK9qXavNl3Vt2fz9Pk6AjNwAqoqt-0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050203

On Mon, Dec 29, 2025 at 11:04:11PM +0800, Lucien.Jheng wrote:
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
>  create mode 100644 airoha/an8811hb/EthMD32_CRC.DM.bin
>  create mode 100644 airoha/an8811hb/EthMD32_CRC.DSP.bin
> 

Merged and pushed out, thank you!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/841

-- 
With best wishes
Dmitry
