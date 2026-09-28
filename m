Return-Path: <SRS0=EiSH=HU=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD5CC9833F
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Sep 2026 12:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C18F41F00893; Mon, 28 Sep 2026 12:41:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790599269;
	b=SCMFkaOv5ax7P0/EAnc9eFnXYKtgOzCa5JcSeUiDgvAm53kV6hfxAdh9W3Evb5c22Nv/
	 Vh/wVS7ZPoTwkN1yqJz2b474DAGyA0crRWyPezjJmthiSVnNUMYJLAHhCChBrrtct4tXV
	 BMzXy7S53N1KDruQXT8yKiBClHqdtUhsWDG9kxEyLMNXhS+A7WWtND8QLgpcw2LBE6XvE
	 0Ai0Q16GUgHAxunubta57heWYmEITGIwR4eCgduQ+iK1kiDpi8VnMPC0srCX9FpQL/VGD
	 vFyJQub8Nzck1kOoxWQDCRBBEZD+HnbX3d5UG/V6B2usHT6BhRXfklClK2M8RuQ4keQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790599269;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/D1cqAF+mraBkOMIasEXuO7a5SEQd2hIki+2bWvLIVw=;
	b=HmgEKd4w+9UhRNZPTksegOykZOOx1H2V+PBRTAmfkrD7c/2ckWAtBg4lE6kCiUY9bagm
	 JdRCg57afzfH1Ko5LbQ/dSIPWYc0IhZjYSrzzCFLNWZNP4Gv55GsuSXXnpjqp1UIQUiw1
	 m1win9fE1tWKPyhqgCVLJ3NMdFIqFiN88LBgvXlSxQJUfSsaOIQWUu/T+CxcHKryFW057
	 flWy8aAChmN6fQ0pWwV2iH0DSW6YvG3Ewj3y6oU5QK0APY0BUhMWxMJmUFMnCa3ASMJYT
	 EgOLo2cO+eLKn9FIlF3MJe8WcCJPIINRZLXfTI0NLn7oNiQe+ZNKPb5M8Lv2ZvYvbaQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FHBA/+0T";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ScSIaJnV;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 127FC1F000FF
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 12:41:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FHBA/+0T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ScSIaJnV
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 127FC1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAK3V1189602
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 12:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/D1cqAF+mraBkOMIasEXuO7a5SEQd2hIki+2bWvLIVw=; b=FHBA/+0T6HrMNCPe
	pBXtEm4w81+nuQ0L0bXXA4PlXVlRo6rqgX4/FvT3nYBaxiV/TjIq2UDaS+92qhdV
	nmTqhKijwMNzjKyXgCOSLbUNzT/1JOdIRKDxFccAVtpP9h1U5PAb3NXAKOl8LQ5t
	VAikboeIu8SWZMqBVuY9zDqKB+FPyzUcBbCpZGnxxAr6duYINJRsOcKijpbNbrkH
	kwoTcaEUKDSQe8LrEMYOUdiyRbn+vYqTL0PiqUB7mzhPmXGiH6G+iMpzZnpOzxz2
	e9wokSUnKLyu/eONgDcLSCuYQ5TateNfzTdweALgKn2kvcFTdq/bbCc5O7al6FtX
	noNsOA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc0q8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 12:41:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc51591102fso1982234a12.1
        for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 05:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790599267; x=1791204067; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/D1cqAF+mraBkOMIasEXuO7a5SEQd2hIki+2bWvLIVw=;
        b=ScSIaJnVTn/H3ae1LnEMbIPKMwfoFSLk7rw6VWaZP7e9ceVAvoI9oJe8bD66lDCIfu
         bl7So/Er5DZWNE+mjswbFSPcKrpV+nryWihIMH9DsUAYk7MHVdtyfpJmHpOgy0LL8kHu
         qTvF2nYqlE3CFe9rWER1SxOF6spXYN/cQMm4ShRDH3YCP7peSiwwX/m43MBXYElL1d/Z
         8OaNXl0XxTa75NAXGUTV8njg8y/JvTHWQ8k+nrtlDjpgEby/5Tqlf3VkVwrskZdLrLoT
         RWlAnJtX/mKYX04RJA/1PhQD4F6ySDnjMB2bHpWa0UVe/tjphjiwuDKe5aHnk77bAO64
         MGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790599267; x=1791204067;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/D1cqAF+mraBkOMIasEXuO7a5SEQd2hIki+2bWvLIVw=;
        b=nSM2cF+5WMUHtLyT5rEa624B8TIYDuLb3o7ZR/4WLJUsZk3cMk3Sd/q9j+jIb6tyTt
         l5Dy9uX3thxWJ9rP433xc0ycSPtiL7omlZ0OpUmUnH7NnUbTi2+ZtXzCazAi+ChlQ9Ed
         m0dsoJScL0i3Of/iPeTftvPrRIDJjtfjswc8yrvPi/tta3YiJMkfE386sSkVOmFOvhL8
         zE3xJ5iTcMgNDYqyrQke2C37zreppY0itiQOoDxTk3KQWLIme+ytqtJn8Vc6hG4fvz1a
         velZtQvmTaULFnoXtqPD1hrNG0RDL8HXJyFuVlCl43HgdLPN5OVnrecRi9niZIpDy2Nv
         T2Ew==
X-Gm-Message-State: AFuF++laBly2fJU99xi7E/XzXNhfbh97cfCqHL8we2Rn923pIcEQotSf
	BDEgaQ32i9lqf1KRy0SrUS0BJTCJSaEUx0wFfyZhD6oiDv3mv2wgdaaxeVEqmJ+/wQvs4WLhrpO
	IkGHQPMkGuzXr2yxr67cILZH14Sh63rifnjJnArt4HaGdpLmiX4JCaisEXMArbydukQK6fkg=
X-Gm-Gg: AYBFou2pAT9tOoKjwbT4TaqRv/4YckdjTpixtyUyXmj90pctWmIM+EPJBI6Z8ROf3gP
	Jcoc4Edm7pq8xBbCA9gZnfY/+z8y6dc48D68yBWb7WAtRD3MzxPerMkGaE63QY+3H1qK2PJBh14
	AVmakX6k5We3S1Rhu+nYMHLcI3LhxBqfwzu3A9cA0keLL/icOjbtoEGzY52xeuB6AvRj/NC0Ffz
	cWAl8BvYJ0pIyvqypA+0DckhoQ0tJObs9BWIvjNMI8BPFlujqfzZ4fNfGL9fGIFpBtbtMZQGC/K
	JTvfHQx+mPUQYQpR8CJFskmybtwGOaWRg7UQEn5EFyP0YUOaOu7mao0gG0+mbhLs1V4GPwrhWde
	DrteDt3nIomeGKpKY
X-Received: by 2002:a05:6a20:2583:b0:3dd:85a9:55b8 with SMTP id adf61e73a8af0-3de0e8b481emr10863575637.35.1790599266767;
        Mon, 28 Sep 2026 05:41:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:2583:b0:3dd:85a9:55b8 with SMTP id adf61e73a8af0-3de0e8b481emr10863539637.35.1790599266135;
        Mon, 28 Sep 2026 05:41:06 -0700 (PDT)
Received: from [10.216.24.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7a3b8d70csm2386468a12.9.2026.09.28.05.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 05:41:05 -0700 (PDT)
Message-ID: <330d9cbe-fb10-47e6-a7ca-3c20dfed4a48@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:11:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Revert "qcom: update ADSP firmware for qcs615 platform"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Saddam Patan <saddam.patan@oss.qualcomm.com>
References: <17812e6a-365a-445f-81ce-42d5bdc774d3@oss.qualcomm.com>
 <p65scrmutedeyecsfdezb62w4hbepel3cr7evgw5gybrpmmjpw@nn2hszcqd4kk>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <p65scrmutedeyecsfdezb62w4hbepel3cr7evgw5gybrpmmjpw@nn2hszcqd4kk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba6063 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qC_FGOx9AAAA:8 a=3Y-KbYKI8TGo4sKcFoAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: _WuW1_J-pqi0dXBHgrPdcZJnkBu8S_g9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MCBTYWx0ZWRfXwX/UBhWqnL9e
 IScmRKQN5ls40O5HVUZZyInDn05pEoeL27zOq7Pf+94iSYjnMRpysSIgliw1rD4uqIKW04OJdV7
 ww7/d6rkTDu1ldaIvQQwFZk32+BlHyb6w4NNwQT7+bWNjr3TTNjimgf/JCiwppVOxEhrHw6Vkaj
 NAuEiknFdEWpm8EyEnmCzDeyLBWjWN6lmXH/tFcWK4JJfPwfNDa/K39GO1Iuo9ACdufguq3A1Uo
 4YR+QiQG4jFHs7MUuDe4jcbKop8iaqGOmP7sdPNHLI8I8a7edZsB+lHpJ6PSt+jzS2W+uOckP0R
 rjerTTxkNYbS0D8ouc73S6Jx9TrQ5BQbtPkiVhDulZoVNXRAeGs/reY7p9oSAtZCbSqCBdjaODF
 b6uyjLyegOe+khEa3jwnDjiBFDoE0sxkXZ6FrB87V/F7IWF13mq2GvYHEOf7CWFdMbIoniiBw3V
 l6wSBKdtiaHXxMWps/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MCBTYWx0ZWRfX1LDrcgQbeAIG
 j/KDjUu0fqd6AN+A/HZ3bY8UXQN3lBeGJoPxRh4aOP2chFCZE2dDgjUrG0NjdhSWPVccImGYJYw
 AR6Cca3Fpi56yj2ZZmRLQU/z4F1qhBA=
X-Proofpoint-ORIG-GUID: _WuW1_J-pqi0dXBHgrPdcZJnkBu8S_g9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280050



On 9/28/2026 5:21 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 28, 2026 at 09:22:57AM +0530, Venkata Kota wrote:
>> The following changes since commit 9b858e5bb58d7bf1fc4d8818cb9100aed6d46f6a:
>>
>>    Merge branch 'rubikpi3-adsp-00249.1' into 'main' (2026-09-26 12:42:39
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dspfw-qli-talos1
>>
>> for you to fetch changes up to e4c6dd83f2578e6c4a53d09ecd165da0780fecec:
>>
>>    Revert "qcom: update ADSP firmware for qcs615 platform" (2026-09-28
>> 09:19:55 +0530)
> 
> Missing DCO tag. Also, we landed a set of binaries with the same set of
> changes. Have you verified that it affects only QCS615?
Yes it affects only QCS615. The issue seems to be coming from a Sensor 
Change for which there is a HLOS dependency missing.
I have updated the DCO>
>>
>> ----------------------------------------------------------------
>> Venkata Kota (1):
>>        Revert "qcom: update ADSP firmware for qcs615 platform"
>>
>>   WHENCE               |   2 +-
>>   qcom/qcs615/adsp.mbn | Bin 8659084 -> 8532108 bytes
>>   2 files changed, 1 insertion(+), 1 deletion(-)
> 

