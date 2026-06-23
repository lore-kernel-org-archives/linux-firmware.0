Return-Path: <SRS0=cTvN=ET=oss.qualcomm.com=wangao.wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094BCCD4F26
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Jun 2026 08:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCA361F00A3A; Tue, 23 Jun 2026 08:29:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782203397;
	b=CR47TPO29QI3ltygBAltDBgjyEqH75QPYt83V1b9kgBApmSl8KDeeB/cJxCd2UeIhzZp
	 kf1laaDU6ls0alkdHvPWnmXNbr3mlSN6mlKQRLOU7TeLDYgq571GIOSJOu7USh7mNFP+u
	 PTbcRxbxTU/KIx2oZ/0Q3VUDcBCsn7Z3Icnts6ZGe0SzK+RotO/7517tgp9AjiaDnuDlP
	 csRmpAqNKoAPnEbk99Gr9DIRpvEr2s4TWsqcjY41o7tcasXrfmwkSt6pSIyT1+bzs/9A+
	 1hKllEUt54fNsnXHqeLpq4i3RxlWRIPU1ixVP0mGqsg7YJkI9MCoztac5p0TsOMnu/g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782203397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:List-Id:Cc:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VP3ulAr9oB5yApkf4+6cfkVKAtz34FMaqBnTixhBpsQ=;
	b=E4c4TdIFk7d1W20v29OGiI2hof0wiImYbPD1HLM9PMSlezd7vCosrhV7YVKE0ZrvJisu
	 dzsTmUidWfbs9FkpzcD3PIirvozbPwCdjLCoG8882secs+sOZPNaQ8xcrauCS94h85zBk
	 sdRjtkaM0++QxMJVXlyL0Wj2s5V8uNjH1axFx90e3Uk4InBhluM9pThzBauOMRSSErteq
	 nzE4fuYWDLcOe7N/KJ+ivEmZZBNKM60ufAsifWnsm2/0DTwYtiYa8QZdAxcTevg8TABlT
	 N89nFUGXSn85yImLdlnLz2Kus17sR7UuXf3Mp58kYZDygwvuKThRn76HkkEpP/jJGIQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="AzAeyu4/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="M0/WbXTp";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31E691F000E9
	for <linux-firmware@kernel.org>; Tue, 23 Jun 2026 08:29:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AzAeyu4/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0/WbXTp
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 31E691F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6d7hA3376127
	for <linux-firmware@kernel.org>; Tue, 23 Jun 2026 08:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VP3ulAr9oB5yApkf4+6cfkVKAtz34FMaqBnTixhBpsQ=; b=AzAeyu4/VeQtPj51
	g1A7I5ozYzuXH1i4iMOiJ3Hk0pGFllgo5UJI5dxzd4yTlhRqYBAKOmCN1yt9zciV
	rTxgVCnRnuKTj6LONDyog2AX+xKcioZDo+uzKZp64WTF74WWINVuR59XWIpWpoq4
	S4bDwA+BaZy6WKJiRDa35wNZXcBcqeMuIq3HGFy1iu8/NV2lKmINCm/vwqLvPn6+
	ahmtSyN/PJv+cRu9DpyWU6B2DN1nPHplF0U2NEyuEdJxF4c34lZwQOQ4LmIWe9TC
	1sXG5RS1fOrfrVPFIyxeEm/VeK56w6HLQG7dVIumJtsAaSXp7JAUvaMV6AbMnGqh
	UdGuyw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5yebpuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 23 Jun 2026 08:29:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845338eb797so728905b3a.0
        for <linux-firmware@kernel.org>; Tue, 23 Jun 2026 01:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782203395; x=1782808195; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VP3ulAr9oB5yApkf4+6cfkVKAtz34FMaqBnTixhBpsQ=;
        b=M0/WbXTpqdismlMcAWZ7133bw+SbkJky1DOMhGbjjIpj9iDmVpgUDEEalBZxSF0hHP
         Z3mOzd8od8eKaAvoPUfK7EahronathMxOPYGBeKlGsulyY2nbhufslYx35oR7JzqNEpd
         lH4x8AqD1UzZJ24TXaK/riKwbFdL22hFcxemTEh4c9g75uHWQA49jjSD6M6AfWE8sV9V
         uszxotGUr2+VSCm0yx+QjclilKRo9krs62WoNMmeq8J/CrRh+TJcoR3yDWUHiQR0UFdI
         0KXxm9aUoasp7hfa4lhx5XPiwMZTr5vIGamiif+Ke8fEukGGm0U6fwg7r4C7pnUBMEYx
         OK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782203395; x=1782808195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VP3ulAr9oB5yApkf4+6cfkVKAtz34FMaqBnTixhBpsQ=;
        b=sj1gLK8ic5FkUk+L3P9+jZvhVDETCmlYqSUUEpA9QZZE908IXLHuY4Yv12rKo+8hv7
         O8KDr1MyCFvZdtnYLe8TuYgFBu15TgVN4RnvzaqrayGp0xw2iI5/cYzYUlDcpveLCa4F
         iV79or2gR4kmDCNHEp8garWMoS0pPmZLhZXbC8S1j4J9H1wJi6lMfakSYsYtkZWGqrkj
         enSbapaVfccxZxJyC61OOpopiYzARvy4YPg/1cgJeJGxNTaPOmL6U9Nh/NEVwjy82Jk1
         iaO6wtQ0nsrAfbKA9odbhThoUMROCC8shXz2Hip7OQ3zyAFT7T0PNfCaNwW4XwJje9XQ
         2OQg==
X-Forwarded-Encrypted: i=1; AFNElJ9ytnMVoTze2vylWIvwkAB4LmYXCWdhHyqFxsP9N+755dEFfOxhELs0VmiMKCDpwnKgGT/eb+C+9MuTQdg9Og==@kernel.org
X-Gm-Message-State: AOJu0Yz4HnfOqNTZty/WhH5h4+wYYEKIYqPbBqeAwmrVCul/3HP2IH3H
	/0tv98XZnyS0e9UL9EIefmf1iqML9AwSM7VHK2PFI6GjdyrRaFa7+wN7x+SnPvp3Ns7apBL2gLk
	oMW9XiM8H9k1iIiI+uolvHfiESqOhAVjdwTgQ+Wh07H16QeZpFV1hqimuh0F/MU9hiAFDD6zBkg
	==
X-Gm-Gg: AfdE7cnuc14iLhAba1wrx0Dvb1WgvYMaVv3fYxQ1LVMUpIxlVvgcZsNFX1iSgqb1L1J
	wdmeQpMFBkCrxBdHWhv0awpnyD7YoxzJyLNoiV6lpNnC2R0h117OxYy6m4wYxI8nocQ5fEFgIXJ
	h1p6pQNuvNnGcBSzeRrkZvZLtge1mSplkVAe2Yml7282iSuBiLMIufeSXcHV6IztNcjurcNTmb2
	DFUkdCGglPYM+SVcXcXPwbzyHlVMV2QAOe1Fzf7dE6BQh5usBoUFFsKDPcragxXCNFqzp+YnrNT
	QH1Ze9paGQcA5JNKp2w+XHK0r5M7aza9xfzROcJG3imR2GiNnSc4BJqp00g8yVE9z65CAk65xcv
	LnPGiHem5PlBLzL01G/Gaa84/r/9sv1AKETIAZedfSn5cZDdtdpiPeaL/t6mvi/sECyE/o/Synv
	O3XhoCdg==
X-Received: by 2002:a05:6a00:94f4:b0:842:4982:82f with SMTP id d2e1a72fcca58-84591b50f0amr2420728b3a.2.1782203395019;
        Tue, 23 Jun 2026 01:29:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:94f4:b0:842:4982:82f with SMTP id d2e1a72fcca58-84591b50f0amr2420707b3a.2.1782203394597;
        Tue, 23 Jun 2026 01:29:54 -0700 (PDT)
Received: from [10.249.22.156] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e76a00sm12151982b3a.38.2026.06.23.01.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 01:29:53 -0700 (PDT)
Message-ID: <7653e9d1-4002-473f-bcae-2fd41fecea51@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:29:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
Cc: wangao.wang@oss.qualcomm.com, linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: qcom: vpu: add Gen2 firmware binary for Purwa
To: Josh Boyer <jwboyer@kernel.org>
References: <45890930-775a-46cb-85e5-ffaadafd829a@oss.qualcomm.com>
 <CA+5PVA46e=GXNjPBUc53cQZBmDGVz7_GGrLY9+Om16ObG3uKqQ@mail.gmail.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <CA+5PVA46e=GXNjPBUc53cQZBmDGVz7_GGrLY9+Om16ObG3uKqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fjUMuVlmULkHv0JrYCTQGF6CThlLvNu4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA2NyBTYWx0ZWRfX50GTGMrHe32y
 PEBEU6WIApDQKi3I5YeL/JyVQM0tKmKtU5GM49pMBFZfPg7VDKdkKANuo7UUaeTCQpZU7QmENQE
 HXaT4wfvYq+27TNC9WRp9bHBerVXWkc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA2NyBTYWx0ZWRfXxAH1m/fkWX8/
 1dqan5Gyv3uWnuFFuXP5QxPBYdRRHw7cHK3i3fA8ndvxtBjB7qU2tFRAw6gc9G3AT8ceUrhqQ5/
 Z1/WJGwnJFQt+5UHURsbk3+kQzclE12DFQ8rwvOAeTaowNmfjBjenORDxpam3rEuQn0O35Ib7VY
 KAqgOxcbOgronp3sVNR4jPh5GC5nR0rVz6LPGBTRW/wt1j41X2v4wDysxxgogbp4tLOEIuSyKqG
 Fxxjxp1cRCXqIYTFKPVY3o+iaZljjc7f19AoiXrJGGctS3F2fPNhPZtIADL9Z88rEPfk92R6NKi
 HsljJijwbog3ZAmjbOOX97HceyNfy2BT/858TzW0KOaBLVqt64IkNkkGKJq7rY4tKR009qfzpBm
 L3FTn3EQ0OtjISRZueKoPXPVHqeBrSzjmWNAC75VG79Jz/Y6CemTVs3xbmbXK5Zqu3y6YjlBcxa
 yor77JrHWVvpQ6CImKg==
X-Proofpoint-GUID: fjUMuVlmULkHv0JrYCTQGF6CThlLvNu4
X-Authority-Analysis: v=2.4 cv=YpI/gYYX c=1 sm=1 tr=0 ts=6a3a4404 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=TfZdI3DoW1mpwW_9stsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230067



On 2026/6/23 4:40, Josh Boyer wrote:
> On Wed, May 20, 2026 at 4:45 AM Wangao Wang
> <wangao.wang@oss.qualcomm.com> wrote:
>>
>> Hi,
>>
>> The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:
>>
>>     Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)
>>
>> are available in the Git repository at:
>>
>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>
>> video-fw-Purwa-Gen2 for you to fetch changes up to 060aa3afb83c5f8c8e1f30ad0d9f8a2088718754:
>>
>>     qcom: vpu: add Gen2 firmware binary for Purwa (2026-05-20 14:43:45 +0800)
>>
>> ----------------------------------------------------------------
>> Wangao Wang (1):
>>         qcom: vpu: add Gen2 firmware binary for Purwa
> 
> This one doesn't seem like it's been merged and now it has a conflict
> with main.  Probably needs a rebase.
> 
> josh
> 
>>
>>    WHENCE                   |   4 ++++
>>    qcom/vpu/vpu30_p1_s7.mbn | Bin 0 -> 2323048 bytes
>>    2 files changed, 4 insertions(+)
>>    create mode 100644 qcom/vpu/vpu30_p1_s7.mbn
>>
>> --
>> Best Regards,
>> Wangao
>>

Thanks for the heads-up. I've rebased the commit on top of current main, 
the conflict should be resolved now.

Repo: https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
Branch: video-fw-Purwa-Gen2
Commit: b8569739ccb57e60ef934b99e249cd32f37e7127

-- 
Best Regards,
Wangao

