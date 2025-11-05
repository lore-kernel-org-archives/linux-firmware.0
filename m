Return-Path: <SRS0=J9Zr=5N=oss.qualcomm.com=zijun.hu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E78CCF9F8
	for <linux-firmware@archiver.kernel.org>; Wed,  5 Nov 2025 07:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC427C116B1; Wed,  5 Nov 2025 07:27:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD5B2C4CEFB
	for <linux-firmware@kernel.org>; Wed,  5 Nov 2025 07:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD5B2C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Kfw9P2996894
	for <linux-firmware@kernel.org>; Wed, 5 Nov 2025 07:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UCvnJgei8yQ1ZhQL+47vsqws1vLzH2ULABHYjl8NRHk=; b=i1u8ZEsD00zaanPV
	W5czhoLVGtcwVTNDNJtjMZViMtXF2CDPTVvi/PBN72UcAK6yRDs0xvgw2b7MMWlf
	hTZuDWx12qvI58jHWJZQ9RbGGp44JttaLayvWLEHo7edlF5xVEpj+1BvWU01CQwI
	jwBX0EZ02rct1jcy/DnEFNUJ+IcQmjNV/fB9iArTKjI3i9tfSMNsPOHXixhj/fKH
	mXh1SKy/qjloNkJMOcuiFRtwP6Zz7ankANzplOOtbTpR2rZCVxikChnV8qnsen/y
	9FxVj7sVjD3xik/GEIxIuqq6dYHCYNRClY8h2LpWLV9qKB8gO+XuxqLXDAcGMAxA
	0exTDA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7c7jkxtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 05 Nov 2025 07:27:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7ae73fc4dfeso66861b3a.3
        for <linux-firmware@kernel.org>; Tue, 04 Nov 2025 23:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762327642; x=1762932442; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UCvnJgei8yQ1ZhQL+47vsqws1vLzH2ULABHYjl8NRHk=;
        b=OfE38EeJL6J5sFJ8KfGmQYzPMdJqglem0/5DZVk3tnBUYmBQpag9kaUmkG7MGpUFMv
         DG81LUjQFhqa/uTFBZ7Y+Cs119CanAO2sPliKHlE78eSUiXZgimLkU1QVGai16/ykV7/
         McovTREFBOehk6/2xhqEmpMu+W2fgv1Jn9vIQZD6E7wE1pfOrcO/G18351y12dXmL3oh
         JjfdhzjqHPtjMvfTPUi5ExgAyZ5dWZBsgK89oFhboHaR7K2GxlC6xwCTAWV+uYlXfEs5
         al6V3SZKCNSBaWZt9z+IxHG3APu0sfWyCxDpp7Odan7+ACHb5GbDnAKZ0wRCxf1h8M5r
         23aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762327642; x=1762932442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UCvnJgei8yQ1ZhQL+47vsqws1vLzH2ULABHYjl8NRHk=;
        b=a+tnMlxlexrv3ENbGp9fakRsiE3iBCmOje77HiLv1b1avN53ae9MyAgaJPcvQ4oict
         bx0DrW8aDgqmjeshb0FgoCF/39gK/bP899xHS7g3O30Hhsh5ntcsGfBDb9dLEmnjHoTq
         Eumw9tVCIwGlLZ2agzjiRdRMfoc71mcQ+0/KiZFWHbxiRo3R27axKuVRnAQ5N9KkLfyg
         pFciy4yV+ChYieSUPTc6hOSYTz+o7LY2ZXVY0fJfQehN1kY5dJqWykEe1DgjEoh51JsI
         LI+v2HWcwNOQV8PBi1uUZL3gm+OU68iRG8w7P5AGCKpgEDvNTbHeogZQhl7a8O0geL38
         flyw==
X-Gm-Message-State: AOJu0YySUXrr2YpP3cFnWUiAVEdQVwWK8s+f4fbQsgAaPLUTCWhUHPoO
	Au3CtgBSnTDdHyVbMLBzPJvAWBkCdkRDONR1VICyhMp38CVzO/dzib45a7/1LpPBwVSYK7aec+e
	fW9WF/dc2RnQvfG1i5GZfnB0XVwGO/69ZvotSTpJKsLG0ZeecPgzBhsVizmYHOxM=
X-Gm-Gg: ASbGncsWendh7JYNUg6Q9PAnpMjQUBtoPOWriE5WX9K9z94Xze4Cl52cA8Ksr+Jr++8
	BwBskGqkyCnAxxREtuaiVOPXEkwg73ZVV/Vy8sRGvp4Rw6yCC45/AJBVQU5vLlh7daTEPZe+Q5W
	Ljwa5ykDrTF7zZDWfHOJYEocSGh8zYQ1Ovokkvdzvasj32BmtsY+gT3zV3hfEOb4CLu0XgE3xq9
	s8ECWSlxLW8GW75VATmRY9c42mfasPmJZzg5ZMZeCg/rZjIgpedNDOwMi/ce3sEEyU2NvteKV2G
	98Xjnl/3quu2m/xdnjMWikYdbAZPi+s9gjoB4mOgTWF0B5bZ1BFH9mBuWcb1oujI3uixsaaPA+r
	T50o2wtrQcn/O3g3WSoFPtl/O1pc5p39pc3vHkJ+MECS/ivrsEmXim0jSDt0WmY5lLg==
X-Received: by 2002:a05:6a00:13a2:b0:7ab:3883:36 with SMTP id d2e1a72fcca58-7ae1f6947a0mr1320447b3a.4.1762327642314;
        Tue, 04 Nov 2025 23:27:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYXoy44PBKs0CMz6a2fB6VvmVUbd5Pv8NhqIknqUUoPWaMNzjV7+jSSrqZfvqZhtn0ZBPudw==
X-Received: by 2002:a05:6a00:13a2:b0:7ab:3883:36 with SMTP id d2e1a72fcca58-7ae1f6947a0mr1320433b3a.4.1762327641793;
        Tue, 04 Nov 2025 23:27:21 -0800 (PST)
Received: from [10.133.33.105] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd3246d33sm5293660b3a.13.2025.11.04.23.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 23:27:21 -0800 (PST)
Message-ID: <47006197-ef93-4199-8532-b8599fc82248@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 15:27:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Bluetooth: QCA_BTUART: Separate firmware between
 WCN6855 and QCA2066
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org, jiezhang@qti.qualcomm.com,
        chejiang@qti.qualcomm.com
References: <aa746f58-c004-48ea-ad75-59813f3c3252@oss.qualcomm.com>
 <CAO9ioeXxv4+68Mf2Li1YKmme75t1EstO9EwGd+RYt1WT9cZ72Q@mail.gmail.com>
 <d69544f0-8db1-4a6b-9cdb-180b9cd96c50@oss.qualcomm.com>
 <CAO9ioeVXeCBAzbKYhoKNHL63HOtbxAyM71WncAy32Rrp2xR6eg@mail.gmail.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVXeCBAzbKYhoKNHL63HOtbxAyM71WncAy32Rrp2xR6eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA1MyBTYWx0ZWRfX3cl8vZleOCcX
 5AGZW/tazHKq0l2jJgO4AbuCUHlfPBpxhO+NoNr6+NPy0jMAqKwYEaCweR8R74Bl4hvxuv2iMiN
 aNPMzlTZv5ClVAxbHZjHyM4cJa1FxqIBITwZaZWwXeqrUBJiCetiyp3fWquD15Ze8HlfBOqQYf8
 REhk5LHHaJyudP+0+dB/z0sXQ4IAAWo7nkZOanQ1JkjovftlvlXIToRTHKGeDivs6hXfcYN3r30
 CCX2OAkZ98rGPhAgOd5TZuujJ/Sjs69YBV+2WB3nSUcA0G0iELeftXF6jEJ94ZS5nYGTi5lu6X3
 8Uce486d+UWjoYTGfAXFBXeCyR2G9PWYdy135mNMWLTG00Rc8/Qkf1oonIM6yqCEjKbwDgJcEh4
 vLA8SWXSPbfT5v+jW50PwB8ME+6ytw==
X-Proofpoint-ORIG-GUID: 8gLLlK5_sD0RWb4IwLNzquXC2VsCwNtr
X-Proofpoint-GUID: 8gLLlK5_sD0RWb4IwLNzquXC2VsCwNtr
X-Authority-Analysis: v=2.4 cv=DvNbOW/+ c=1 sm=1 tr=0 ts=690afc5b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QNrXxQw27bMNMQMj664A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050053

On 10/31/2025 9:36 PM, Dmitry Baryshkov wrote:
>> Customer did not up-stream QCA2066 DTS and also not specified firmware path
>> in their down-stream DT blueooth node.
>>
>> Will change QCA bluetooth driver to change the default directory to download
>> QCA2066 firmware from qca/ to qca/QCA2066.
> I'm sorry, it doesn't work that way. People might be using
> linux-fimrware even without upstreaming DT. If existing firmware
> worked for QCA2066 and WCN6855, then the firmware with the same path
> must continue to work in future. If you are adding new firmware which
> breaks this compatibility, then _it_ should go to some other place or
> use a different filename, not the other way around. The driver should
> also be able to fallback from the "new" location to the old one.

We still want to convince you for this solution based on discussion internally.

Background:
WCN6855 and QCA2066 share the same BT firmware files qca/hpbtfw21.tlv qca/hpnv21* currently,
as they are different chips and have different feature set, in future we want to upstream
firmware for WCN6855 in qca/ and use qca/QCA2066 for QCA2066. 

Solution:
1. Copy BT firmware files used by QCA2066 from qca/ to qca/QCA2066/, QCA2066 will use
   qca/QCA2066/ as it's firmware folder. we will up-stream firmware to this folder
   qca/QCA2066/ for QCA2066 if there are new firmware to upgrade.
2. WCN6855 still uses current folder qca/.  we will up-stream firmware to this folder
   qca/ for WCN6855 if there are new firmware to upgrade.
3. Change QCA driver to change QCA2066's default firmware folder from qca/ to qca/QCA2066.

Risk:
   For QCA2066, there are no up-streamed DTS currently, customers we known does not specify
   firmware path in their down-stream bluetooth DTS node. For this solution, customer don't
   need to do anything and have no risk for them. and they still download same firmware
   as before.

   The only scenario this solution impact is that current default QCA2066 firmware path
   qca/ is specified in their down-stream bluetooth DTS node. this scenario should be very
   *Rare* because current default path is qca/ already and they should not specify this
   default patch qca/ in their down-stream bluetooth DTS node again.
