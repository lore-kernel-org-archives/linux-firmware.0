Return-Path: <SRS0=93cy=34=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B37CAC598
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Sep 2025 18:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53B83C4CEE7; Wed, 17 Sep 2025 18:34:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D73FC4CEF7
	for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 18:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1D73FC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGCL7e019539
	for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 18:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mjo1FWo9rsnPo/u9JvSIDi/rg4zHtO/Wt39UNKAo35c=; b=KfKXzmiIzw/zt2QF
	DqdeB195o+c90qoyDEtz0/rwa0c86Iom/nLrTAC/bMbs6sJQ3ogr2A6HWgk61mYf
	my6qqn+4Bdplkq26pItHFRXuDRVH0jFDusJubw66+FybrwIPrioiAaPJhN9W2GLp
	Sc7g6w2bWxfwKw83nENSCNkdYmDcK7PXC4+b48u6K9c3fEJcHXQrrBSeds8JbUqI
	T0FTf1HpQp7VFMlKDqXzV2YRM/K1AziHwXZAMdxRRhXbOc9eU923MIpPmNVK+fXC
	+ZkFs/GvOQgAFYvppjHUkEfhzaxHA4pY9fvxCbWkkm15TuV0eS+fGHakMcr9BlpE
	q0I99w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1uh1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 18:34:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b54abd7e048so59766a12.2
        for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 11:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758134068; x=1758738868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjo1FWo9rsnPo/u9JvSIDi/rg4zHtO/Wt39UNKAo35c=;
        b=JqmkxS05zYUNMsufrbojAsF1YebTA+DI9l3J3CFSp2kgDpxzZZYYJ86dPKdsdGyycs
         fQ9MyhLVSESy8ODho5OeQstsyQkIrYoBkk1u76xEqoSkmwfI83KK0ZIRC7GtVFI9Of/E
         ADIiYVbms1UkKa9O2vgt5y25TYRW0bSRHAynOczm6GFF+y0eBW8E4+2G19kKAo1u/zhx
         KV4GMNJeYHjfUA2gdmaAlVFjkafruhZpyM8hltwqAm1VQjP+9sn5UWqnOOHo2z9kRPaR
         01/1zmkfVs8an4RTgMtmvhbMLPbtUoTa7DjcVOTVI7CHg7+zvAeLREbdly8IxI7ShISt
         elAQ==
X-Gm-Message-State: AOJu0Yzkog8fjdHUoDuUFOWY1P5pcY/abUO8ZajFIMZkshlwGgLHZDRj
	w0QKP4cYMhrPv47hNNWavoBfh5DHLZq2EcMvw8YmJDB/RGzwqlMuQ6e3XDeeVIoYSqv1hNdMPWz
	giiH5xNdavCjjFKsLbDFaRD/NWfVZoa+WcVLFHDzvvRpaVZEKHGT6g20Fh6Z4prs=
X-Gm-Gg: ASbGncueSG2K57T9eDz64JM4mMeq/TOBpWFFbzq2wXeDLWo06Rg0bEVchUqGO1mk84t
	BScaUMGnhSqkiN5W5+e7qu66GI2mT/C1lWZmdU0mIexIZHQ8b+eiVbb+2wNz66l1Yx6V8MJVxvX
	callFXYf9BLTP4g9qwJQqt88IlBmg5OyUY6/l1VC1yZEwEWBSmoVOXM/btigJFisOc39uTMPxDp
	ZHbeeRX7L0AYqV9VKSFgvp3c8vFuOAh+9Ci+hLB8UrVuMaiUKqhPf9QuuiU2JdBLt0ut221/ZP6
	nkfjxQkB6KaumluGyXe1Z5zsacb66u4Qs14WzAi6TRjWPLj9+2UEU27tOO80PZ/Z3mX8E9F4
X-Received: by 2002:a05:6a20:3ca1:b0:262:4ec2:aa7a with SMTP id adf61e73a8af0-27a9586b95dmr4668717637.27.1758134068495;
        Wed, 17 Sep 2025 11:34:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAZYEpRxyy7whaMS7Z7IgJYJU8xbrCHxt/hQUXUFPmuwKh0rxzPEWWKGOEN7DNogYMIwnXKA==
X-Received: by 2002:a05:6a20:3ca1:b0:262:4ec2:aa7a with SMTP id adf61e73a8af0-27a9586b95dmr4668692637.27.1758134068048;
        Wed, 17 Sep 2025 11:34:28 -0700 (PDT)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfc2490dcsm110770b3a.36.2025.09.17.11.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 11:34:27 -0700 (PDT)
Message-ID: <3b21eb8e-4124-4ea1-a8a6-2190d25e2226@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 00:04:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, bkumar@qti.qualcomm.com,
        ekansh.gupta@oss.qualcomm.com, kssb@qti.qualcomm.com
References: <3b566cd9-40ff-430e-bcae-1136cbabdf11@oss.qualcomm.com>
 <5gftkkb4i65gadzrnbzilsucrgcj76jj4ovu5yqt6fzfodiuva@eyctfaizlxy4>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <5gftkkb4i65gadzrnbzilsucrgcj76jj4ovu5yqt6fzfodiuva@eyctfaizlxy4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E-XgwXPazpy8g1SIVCPdrpw6PIUoaMZ5
X-Proofpoint-ORIG-GUID: E-XgwXPazpy8g1SIVCPdrpw6PIUoaMZ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7FxShEl9/zhz
 KpvTGVFsQ1aSsndcoQjpCKyRs38in8xIH46RLq1qyhFsLlmxdnmRhaJHH9gnyXDOL3tbXgFvXVj
 uqatHhUOPr+1s5ocNX8Q9Pd6xgaE/mSlm2fNYoPPcN4d0yf71xg179J4LumlEOrtKc2w7AlvLQE
 EF4LHWHPQGkrKBPvoFYsZXaEE8KrWzJW7Bymj6PhpQT55DF0oNta9Ij26DUH+qvF3jQ/OsqYKah
 rxgakYVNHt+JC6MemJ9ovISwo02S7zAEqQck+FNCvPEs+W26lP/yapyixlRD5VtNn3PDJhafN9s
 UUXov+NPR8DQ/9VFuS5iH9xaiZSVqcAlybqxgAZ0hoW2tKZDV6Ju3Zr5/yiueszDlQ/H8aA/JLv
 hTUSzKAX
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68caff35 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=nFfeihvJYxfDf6M8GAcA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202



On 9/17/2025 6:11 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 17, 2025 at 10:31:53AM +0530, Venkata Kota wrote:
>> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
>>
>>    Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-qcs8300_1
>>
>> for you to fetch changes up to f504dd64f1f5fde3aef24fcecfc165cf8845b22f:
>>
>>    qcom: Update DSP firmware for QCS8300 platform (2025-09-17 10:30:17 +0530)
>>
>> ----------------------------------------------------------------
>> Venkata Kota (1):
>>        qcom: Update DSP firmware for QCS8300 platform
> 
>      GPDSP has a capability to support Audio PD use cases.
> 
> and? What does it mean and what does it have wrt. the commit contents?
> 
> Please. Please. Write sensible commit messages.
> 
>   File: qcom/qcs8300/gpdsp0.mbn
> -Version: DSP.AT.1.0.1-00096-LEMANS-1
> +Version: DSP.AT.1.0.1-00125-LEMANS-1
> +RawFile: qcom/qcs8300/gpdspua.jsn
> +RawFile: qcom/qcs8300/gpdspr.jsn
> +Version: DSP.AT.1.0.1-00125-LEMANS-1
> 
> Do you see the Version tag under any other JSON file?  The jsn files are
> not versioned, please drop the last Version tag.
I have remove the Version Tag now.>
>>
>>   WHENCE                   |   9 ++++++---
>>   qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
>>   qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 3080192 bytes
>>   qcom/qcs8300/gpdsp0.mbn  | Bin 5832704 -> 5873664 bytes
>>   qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
>>   qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
>>   6 files changed, 57 insertions(+), 3 deletions(-)
>>   create mode 100644 qcom/qcs8300/gpdspr.jsn
>>   create mode 100644 qcom/qcs8300/gpdspua.jsn
> 

