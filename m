Return-Path: <SRS0=Y23F=G2=oss.qualcomm.com=shuai.zhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9EEC61DD6
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Sep 2026 02:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E7901F00A3A; Wed,  2 Sep 2026 02:04:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788314657;
	b=l4DBLiqvdddx9J3hgW4GCoGqDGYX4wevqV9UkOv3/LHr2oLPTLcqZY93Z+B431ZRCUOw
	 fnW7KMn6ueqNcubKgfYKmKqt+QONkngK+FimbxPeyZvAcSmcUbzQC6m79Sr1f8/qQNsqO
	 nce6WHMVpLWn70hj0/Fvt2ZilRwH/hFSYbTOqBwr6qKl0LLa9XImoQLmw1magCVjVGKtW
	 UIVdqjmKouDmyeYuZ5YuL1Ro4qlZukMYaQ8Niw4sffORDjSY/a/uoKcPKVpUXwpKKWovJ
	 JUpN5DjZtzzUWZgYcnqY4+vJKNDjqhlsg7skoGjFmw37F5ueyZ8mcDwCgYV+Bc0uzmg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788314657;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z6cZ+IGxsGlCd3XeLXMq2DlVJdHhxtOT2gm5fVjMTLM=;
	b=rO9Gh29aZ1PF8y90po5kmXOdmsghhH8pHomH/iL/TtQs06AETnlurkMZkri3k6L3zMs+
	 gVPB4L8tvOg0AEC/aAM7HodZwR7l5wyWI2Vw6m7UlyrmxOne0zCO4ML5zuVX4bxMOrfh/
	 2ryvpZaYsm7fw8So1GiLsT0bH7bvKqq1Nftb604R3Ijkc5RS2KLCv2G4TKF2WPkvAB10z
	 rHi4mAOcyJlqCDS3eMX9SbvBOYArdfmVzWxR6EQCM6xtfjUc4k8DOrq09TuC5k0P9zVUI
	 ANyP7nsmpWk1e97ZWaXvvdZ0g3keT2qVKPDnjDb/WlMTtP7DD11UOB1TypVCOA9uekA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SLiROMGT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKMGpNSE;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 544691F000E9
	for <linux-firmware@kernel.org>; Wed,  2 Sep 2026 02:04:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SLiROMGT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKMGpNSE
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 544691F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTdBq3849586
	for <linux-firmware@kernel.org>; Wed, 2 Sep 2026 02:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z6cZ+IGxsGlCd3XeLXMq2DlVJdHhxtOT2gm5fVjMTLM=; b=SLiROMGTR0AEStfW
	XnTRiT/Us0ta0Ay+U6kSCQeFHqQJR9pcD1j+PnVGcwbJGNFRfWoV4QqXmvgsk9yL
	KJw2WqgcvXl6xmgKn93gznkDjvL9V/3GsOc16EFUmesuVOnd+uqqD3JQQy/j//W4
	Tg+hsgT8R+yOkF1FkhxRVPHhXg/EAcTzfuilszL1BpEtMsnVUiUnZmK+d2nO0/yO
	lFZRdPZwID/nilAzDxRnICTykoY3dmTYEayvqKXs3nQ1i3WnU6vCL0wXHPC0eOnS
	tTtoUduYlESzjsJn9pXrLPRcyK4Rp/wHHNXXgQMZ8gxV5/giYRH+JAn1IMhN62fj
	YgTQNg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge3n0smh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 02 Sep 2026 02:04:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc73f47bdcso5804725ad.3
        for <linux-firmware@kernel.org>; Tue, 01 Sep 2026 19:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788314654; x=1788919454; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6cZ+IGxsGlCd3XeLXMq2DlVJdHhxtOT2gm5fVjMTLM=;
        b=eKMGpNSESksEDUCC0PTxY9wz9GkWpPPLGj6WZnb/33W0wIqexf/zoOmEp5R8iyXD70
         aNVOZbAUD0es6A0PIYB32leKARpR2D02L8EE8BlR/YWxa0HStLl5SRMm9XXSR/QhNZjc
         TCxMIGQwHSiIovt14IonC/YC+KeCGR35/Hc3l3Fu3XKgAPuullpBc6VQdy2RnxV3nX78
         3cP8nVJi6wNXzfmDBlsbtbdxjV/0up5TvaMe66N2GiIRfVY++cTCSvUT8Xz8wmjOJ3Ub
         U+Y/v6voKL/DY67tOdxat9zrmcd1Y3t09aZCJ8k9uXwYVS7GeF4HrHBjj726ZZIvjj50
         3tPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314654; x=1788919454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6cZ+IGxsGlCd3XeLXMq2DlVJdHhxtOT2gm5fVjMTLM=;
        b=AO0TehdlgEa6LWGwdwcLX6sVQhB6PmK/kM3ORbHh3llwNBt+diaC+ZuiasdSsAx5Wk
         F54Vw4CsW07iZk/hNAx04Q/7u8J0uM97Z71G4xf9OtiOhaMTiY2Aq/P0PCMJX/Aj8/hm
         5ftY5NGmbYldyhwWeH6JvsWq30otXrhphi15YFADO6LMYGO2G3XdPtlUlkDPEdrA8d6I
         VjBZheWl1RC+Du6PqDppBVypTBqLXkLeXqow7IUO5cgHrTs8/BZE9XB8F4mmK9qkZXs3
         W4X+s84AeQ+l0XTXTe4nKGKMukZyHeI/54Knb5le0sav8BvW3tx3+WDecdFCYw2LElVQ
         zmPA==
X-Gm-Message-State: AFuF++mWETKI7dHnbRSo32yHCByhp8SW9VxGEV+K1r91dhxPpJ85nbsv
	s49m80CsWCf+BkL1G53EKYQVXxR9QENbyK/vrw9eWFUjqwiVjevwZz/gpE2TukttIemyqsR4AaI
	ZpXGNx2tmaBOUyzP9V/pw3g8wu1wRGCgPWfPwUmNk9lkFDe7go1kmnOXq0ujy3qk=
X-Gm-Gg: AYBFou1Yac6tpfZS2n8nAF+JH3RRpGbS6Z0M5MnRDcAoBmY3qOx1TYe2uHCYKy9Gd11
	prSKD7gdZfBPklaiWp21t+kQcs8Oy5YyICrBuls3WNVU7bF0Geja1r7LO7tJ8JeedLQd5ba6DYp
	cIKM50rMrOyurk3MLHBneqDudATyscRnTgvX27CbhxWoxk7cD7ZwYw4BPMh5ZnCx/haLW5/mycm
	2p2mI8Qrpk5OGtNfAD2g4G/xvlrj9mK4DT6FB1Un1kEsaAnMG5Kjqr+b483ggoEHdUc3TOwRgid
	e+wERaeMa0xmNTOIqjUmBVLnwwO/Lvx9OhGHm3ERI+IUO7BUp3mngN/ez8CBYrw95IfMY0ZTMUA
	hZq/YVgQ1ZIyw3p18GT2oNpT4WzM=
X-Received: by 2002:a17:90b:164d:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39aedeb9aecmr2057415a91.1.1788314654107;
        Tue, 01 Sep 2026 19:04:14 -0700 (PDT)
X-Received: by 2002:a17:90b:164d:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39aedeb9aecmr2057311a91.1.1788314653545;
        Tue, 01 Sep 2026 19:04:13 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0dfe665sm2376172a91.2.2026.09.01.19.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 19:04:13 -0700 (PDT)
Message-ID: <4054cd15-d1a3-4157-ac11-f4d248890865@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:04:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c request-pull
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
References: <eac4e82b-47a4-48df-a8c0-445975a14f5f@oss.qualcomm.com>
 <4z7ylgqvfizcdzyakkaymp4l6hr5qx2g3tddaqvzfqujecbxye@qu37vrgudb3e>
 <0b6bcc31-1428-4652-9855-4a52ae1c77ca@oss.qualcomm.com>
 <os2dizgipn7xbnbgycs3h6fyrcbsk4ybutndexwl5jiu5cd4ax@2xvwaxte5ys6>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <os2dizgipn7xbnbgycs3h6fyrcbsk4ybutndexwl5jiu5cd4ax@2xvwaxte5ys6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAxNSBTYWx0ZWRfX5bnQW4m1zjNF
 1q7kofpSgU0n0iDV9aRcem6poLMyLjXtI37Aqz0f771J7AvckbXvLR/whcyrUNeLGJWy8NMDzB9
 fyZlEIRHh+6r9YlRv2LZfpR4gyATJyKONVBUS+QE1hO2yfrvRNy3U8g4lyUbpSK4P8hJ7/9UlGp
 qdLg3FsiqzEOC31JKU95I+aVm3IbJffOnnb06Hi05z2/S9dySaOvPHKgl3IuLBzdOmoL47pas33
 kusBeVjmGOJRlf+o9TM+VuqTGGOHWQt5/IMrWAoWRzXPyhdB/OqGiaZRFc91+/OL13NS+0Hcxli
 ESAA+NdmKw5SGvlEdpsoBQEIxLF7VOxGhOxoBlSFIYykHKVVRUCw2QgA8nBmXZQ3q6NM90PF6LA
 Zlbtr8lHQMtK1yfiRfwCiU5dLN6UK7kmrSkZD9lCBbHi3ukRmSk+34parZROX/7SYThKCCy/m8J
 ACAhQyPbmZnlglZn4yw==
X-Proofpoint-GUID: gzOHoWuvk-ZsGfpheStQXe9sDjPF8UNp
X-Proofpoint-ORIG-GUID: gzOHoWuvk-ZsGfpheStQXe9sDjPF8UNp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAxNSBTYWx0ZWRfX4jZcYWkCJbIk
 mM/bGCL7jbf1dF2yYLZe4rf0t2dcH9/s46gkXPQoFBCeMLDn3bdY7zD80ABKh//OLK/Xqj9bwiA
 L4XR40i+WCfEhcJphGLblLyTWOUcSWM=
X-Authority-Analysis: v=2.4 cv=R9oz39RX c=1 sm=1 tr=0 ts=6a97841f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=rcCgJzkZcK6f5zmTL_8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020015

Hi Dmitry

On 9/1/2026 7:05 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 01, 2026 at 11:07:20AM +0800, Shuai Zhang wrote:
>> Hi Dmitry
>>
>> On 8/31/2026 8:29 PM, Dmitry Baryshkov wrote:
>>> Please test your PRs before submitting:
>>>
>>> E: qca/hpnv21g.30c not listed in WHENCE
>> Thanks for the reminder. I'veupdatedthePRaccordingly.
>>
>>
>> are available in the Git repository at:
>>
>>    https://github.com/shuaz-shuai/qca_btfw.git qcc2066_fw_v2
>>
>> for you to fetch changes up to 2245d3d1eb0593145573a41fa941e4e056031cab:
>>
>>    QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c (2026-09-01 10:51:03
>> +0800)
> So, previously it was a link, you are replacing it with the file. Why?

I checked the WHENCE entry and thought the symlink was incorrect, so I 
replaced the Link entry with a File entry.

hpnv21g.30c is a renamed version of hpnv21g.b111, which was what I 
originally submitted.

Please let me know if the preferred approach is to keep the symlink and 
only add the hpnv21g.30c file.

>
