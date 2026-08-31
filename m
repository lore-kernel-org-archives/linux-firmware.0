Return-Path: <SRS0=8S2y=GY=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FED4C624A4
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Aug 2026 12:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A4331F00A3D; Mon, 31 Aug 2026 12:50:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788180613;
	b=UWGFdDE0AV70XE/x9uQas6M/qo1+Pd+cQJvv7DisirxsCx/tvOuCQZIGR60DCMk5reiG
	 Y3LuLyb41ajs0HksL3VLLcitD4FVK5aW3Q+w50Fjlx6G29mmFclXKLZnmCCuNNCPU3qSo
	 eVepV7gDv4WBLmnUzHfqxiOdyCwkV9FQ7Y9+XX6DskaPl0wSAhwO0y83PXeWaiHjBLok6
	 0r8yHLuAi2NeHcH9SW38nj3ut2AjdDj2gjFajqQXmR8iP3uKWD6wZXcWLmm31zqHvFgiU
	 JALKh3hCQHQp1i/U4OqgYdRCa42pQJ2XfcY3Pidl2LA4JtEU+7MYP9qNdi2xojT48/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788180613;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CbLzVdkqk+78GOjm8SeTFAvTXyFy4puALT2c5UZUZVM=;
	b=ALz2tri3necsfiBZuhRR7UQsC5nTmD9XMnyD2zqW/M3omiBQjRdp9db13LrLYC9O9JWy
	 kSD1eOsme1kyfQ0l1Cbh5U7UsGWgzk5lxQI2NTJHyAiorgEeZyjMP3HR87L9dicdckTVv
	 5I9TCxyiBJF22uwiVjTLB9TgIvhF0uCfqkzErhmz9C1EZG9IuFOrYWIUYkjPoQQDSm7ZC
	 DK30jwCjW7xOmXf/k0Ob9eGmsOUJZWYWsxr5XyyFGxGlWEAefa4QZr4ux+mvoiV5bqjD1
	 CeYP9GROyNuV9LkGUxLARCSc61CQKB6TS6/ZPbgg900BwT/he0pH+zbPFDQJf1UBUbg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OKK9ispk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxS+yE07;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 92F3A1F000E9
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 12:50:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OKK9ispk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxS+yE07
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 92F3A1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBADbc2848940
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 12:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CbLzVdkqk+78GOjm8SeTFAvTXyFy4puALT2c5UZUZVM=; b=OKK9ispkn/0lU2yG
	iSMgtU5LzbqeYDOVM9GmAMmSediQlFNcaNq4CnGJBLEXDIBeVvloFvKXRO65W6Jn
	1HuOc+L5/K6JQAqsbEMT8XI7O4shMNARoFcYZMee8bGSOH15xwoWIF/izBLsULA8
	Ns0we92EPfGZQKbuo+U5x32RHTnmg9CJeyR8U+eytzfqTysbKWK1P27uKSk6n7VM
	3q39uIoAbiv902a6ycedYCx7jXvnKndxLJuiHALfT19jed7v28PzF39b09+Zlz1Z
	6MDKRMoZxrEeRbXTLOKHw1178+8jeDMFFUbIb3gonYaVXgsJko0ol1oF+B5Y61vl
	49QwvA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6aygxk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 12:50:11 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-451acf33124so4950107fac.0
        for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788180611; x=1788785411; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CbLzVdkqk+78GOjm8SeTFAvTXyFy4puALT2c5UZUZVM=;
        b=LxS+yE075KZGVKk5xYZccvxN/87tcJvSFaaU9PplDmBZScESqDlCt8It0nXS9lLcnm
         K1fLa1t3nwocDKLVI7Tn+PKiAeycXzxvdb/Wb7mgnOznlEHiZfrCo09u3d+5C90xHy4E
         CBTcUwR2uW15svmvhWC2oGXmy6b4oT8pVNBqvoMcnLawljuljgVeI3Yk6lHEusYX3Js9
         BK+SOE04/tzYG+qi2/ab1cR7eN6bw08HlsYtqd68EcvDXCNl7eKzL7m80OfaxQgu/ycO
         uxoC3vRXDq7J3a2v0B0JwM/Dqbi+I4g1UwwZ6ey1DS7MEsxtgPieA6xgi8qZFPf7t+eY
         0vgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180611; x=1788785411;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbLzVdkqk+78GOjm8SeTFAvTXyFy4puALT2c5UZUZVM=;
        b=swtJ1gpI4Cm9H0h7uSoaywM0Insz6IpEdGqHY3dgxxecnIzI6/LrAeRVVaTSW8Tk+k
         K3TUGipe3fHZAKIByk+i5Cd2w21pRrR5yp2tdDR4O50e+iDOffWzWXOIaXKhzJx+tskZ
         j6k1TB3GRcXtvnPE/M5oXLY1biXn4v+HO+wY1NLnBY1wCjc/QhDnYW4dZ3sjeC3ousAe
         V6edpVdBqSH1oGv68SXvsKYYYC2IKathRlB1qYTyuA8NbVNAs61IYhX7hX4Wo6Im2/iI
         oSHPr5lgE4GB2E476IEYmGa/Z0RL+W4SlPn+QkM4AmHf+14XEHFAgXEMe6EsoONdbdj/
         sFVg==
X-Gm-Message-State: AFuF++kEASxDHun9cphSNNeG0qiVE6POkURvudbzhrZI8amC5asQbSv1
	CDRdo8gNQg4riPhUsn4S2UrUy+BSrq8He6adK8FJUTVkbI88Z8S3aImv3elCKo2ZKgbVEtf2tTI
	NmsaV9HCZFKTmeC9aN8jDPNVUDvnesS/asCRV/fmnxSham1bV67KaHGmLPJjTFpU=
X-Gm-Gg: AR+sD11KUWAL92w+Eu584/SMemlonsjxL7az4FQuywX9KvUZ4HQ5dNu07AbuTVBCX/c
	WmfqJxMEqScjGZORtDc9lMlFzaewxNUMt8HgjS94F7Wy/ojSFy9d9Ev4cza/3w/4Vyqi/F2PnMG
	Nb5VEVptRVjsflLphC1rDHjpCOonsKPFkOG5MS2h5ZjXRTMAXoTzqqmxNq9TkMVLQAulRpbcusA
	Ih1Qa15R05ieEBrOFiw39sLFDOHJLUaL9aJNRvglUcAkDZsuLY2QlgBrIS5eOzoHUYoaGucQbPf
	zDkwdlgkktNlb7Z+MQHlDiVbaddoMZtjt/WgFE+ZHzKQ1nzcwJqj14LDudcVJdvtE49tAzGyliU
	zl9jaEBEkJ8rehWKlAWSpS9aYYsSMOuXD
X-Received: by 2002:a05:6808:c40c:b0:4a4:2424:eb1a with SMTP id 5614622812f47-4b5b80c3d6dmr640893b6e.9.1788180610668;
        Mon, 31 Aug 2026 05:50:10 -0700 (PDT)
X-Received: by 2002:a05:6808:c40c:b0:4a4:2424:eb1a with SMTP id 5614622812f47-4b5b80c3d6dmr640860b6e.9.1788180610179;
        Mon, 31 Aug 2026 05:50:10 -0700 (PDT)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b3a1995f2fsm8017835b6e.11.2026.08.31.05.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 05:50:09 -0700 (PDT)
Message-ID: <3ad36b00-f9b1-4450-ac63-40b8b7c9d0b5@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:20:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: add ADSP2 firmware for nord platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
References: <10a44e53-3531-4160-9782-f7d62f7efb6a@oss.qualcomm.com>
 <xtiujal7w3ydojjcloqunfhvei33i7gpnxzv5ae54qms2nvdlq@4dzxi2u2frik>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <xtiujal7w3ydojjcloqunfhvei33i7gpnxzv5ae54qms2nvdlq@4dzxi2u2frik>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDExMCBTYWx0ZWRfXxDQC7CZMqDAk
 ajVCQxJ86u07Pyo2VYzad+rxg2gkZ8Wp/WDFftfy5dQX+qwKZ/QQGQ+Slpeb6ixUccObKuE0tSY
 LkmrVGrvNWKpxB6fKRHlbup0Hv+po28=
X-Proofpoint-GUID: RdXFwzYrQUfZE_7J06TYG3r5M_wgzX5L
X-Authority-Analysis: v=2.4 cv=CYE4Irrl c=1 sm=1 tr=0 ts=6a957883 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qC_FGOx9AAAA:8 a=LMq-6pSXMF8d5y1cx2AA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: RdXFwzYrQUfZE_7J06TYG3r5M_wgzX5L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExMCBTYWx0ZWRfX3sJuZDFEXnNV
 FDz6vbTBqxKFpFhD86fJ/gPLQV6lgKzZ/OeGIhaiNIiCZZiObUYwt7ursdV+AjW5CgGEEU48/oh
 SE5H+Er9j35L4pTwtkJWUowNnN4iJyGSMjuaFn58dsMA04m0kLO2QbFgqP6lJaWHw9AJZ+n7yWr
 tBU5V24Gf5NW0uF+4E1UJmvgW4d3FJsdCrYJ1nJP/LpPlAyt12wT3OKVOHlGPgH5HlcoAEz3Hqo
 sq+g+/c0aQX73tU2tY5nZJQZRuZOIdDvMJKT0TlekvRl/I6hxyo8GPX6hdpHi6EIUfQPfgPJrrJ
 E2BuSJmh+VC8CmectEFqSw/aURnEIahotL7x39vVTJAmAn5CawK6HZBRqcHkGQkWhno1eUOAM+T
 OmzFTyt1But8Rnhd/B/QRAfAmD3O4WYpA+iQgpNhcU2HVB+Ciazkaflgig/V3OgjuI8iL0WDWPS
 ubaLYJPL25fYn2LVn1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310110



On 8/31/2026 6:03 PM, Dmitry Baryshkov wrote:
> On Mon, Aug 31, 2026 at 04:00:15PM +0530, Venkata Kota wrote:
>> The following changes since commit 458e40fdbb4dad5134ec230a42df21aea1b5baf8:
>>
>>    Merge branch 'amd-staging' into 'main' (2026-08-29 13:09:19 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-nordadsp2
>>
>> for you to fetch changes up to 93681b24b15639f4e56102f82da073f0bf63fcfa:
>>
>>    qcom: add ADSP2 firmware for nord platform (2026-08-31 15:51:54 +0530)
> 
> What has changed since the previous submission? It's still a separate
> firmware image and commit message which explains nothing.
> 
>>
>> ----------------------------------------------------------------
>> Saddam Patan (1):
>>        qcom: add ADSP2 firmware for nord platform
> 
> Please take a look at the DCO documentation. You are submitting a patch,
> created by another developer.
We were just checking why the Robot was not getting triggered for Saddam.
Wanted to check if it was an issue with the User or the mail client and 
i pushed the mail.
We got all the differences between ADSP1 and ADSP2 now. Saddam would 
push the commit message and re-send the mail.
> 

