Return-Path: <SRS0=pYmQ=HB=oss.qualcomm.com=xiuzhuo.shang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BDCC79F8C
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Sep 2026 08:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 326AE1F00A3D; Wed,  9 Sep 2026 08:12:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788941574;
	b=b/RUSP7eon/TlDumJNe3B7I1n7u9zQJjwBrW/69t6vKFquXnYGm1PnbT/n8Q97snd7Yv
	 BL0uMyiMX+E4ja3Fbrc5SyuG8Tu+UAgQM8LuWxcOLgAMTABBJXIqr3O/nYXmOmBMELZfz
	 vnlQtCtgu91tihsvW3wp5LKlkk16x7gNsMX1CC8RHiIoZN4xknSS2EV+Eemfbe7u/bi4C
	 9vjOAdX4tfx2S+0h7dIwpwhaEcLKAamu3UEeRmzPfpdpaSiXgU6ELrkjqySOavw4pK4LP
	 3071WC3szjHTpP8GmpU1IHte1ElhsXz+2cAojXZ1DRLTTbwcsfojM0Qs9vNY64eBmdw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788941574;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:From:Subject:List-Id:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j9Vog8lVbKT5BVSSC20ttjLtxMGAmXgap/JnOO3lNBE=;
	b=24jEWBppBHiVZ+ThQ+Y3NixsPtPOpEmf1xop9upMLRpLD8CV0QoEqheoHGJOtiGzNqF+
	 qMBVtjL8Om5fUckSu7lIUtlsaDKNxE+KpYpArhOyDZZf7xZmYL57dW2v1a51NrIZaaWb7
	 chOOAcEVyinsMpeW3/7p989Ze+rxNeYgt7PaDeAJSHmR2drM5znfxHZwJwYgk4/jA/Hgr
	 Jvdjup4YV6RdqJlu07CC+Rc0s9QDtPv+D0K0lhUZIUmx+zwYbpEwvs7AJJUhhH7QOhBjb
	 VQKbBJPA92aXrj6PpANRNbTAA85ywOeRTu2vTmNa+h+9K1RMcr6zle40kzTu4Pl0iFA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9Q1p+SI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cS/kPhjr";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BF5B1F00A3A
	for <linux-firmware@kernel.org>; Wed,  9 Sep 2026 08:12:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9Q1p+SI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cS/kPhjr
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7BF5B1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896De9u482354
	for <linux-firmware@kernel.org>; Wed, 9 Sep 2026 08:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j9Vog8lVbKT5BVSSC20ttj
	LtxMGAmXgap/JnOO3lNBE=; b=H9Q1p+SICLAsk1sWDSS7jpPi7aTMqVPpd8Gil8
	44d8Fr/om0WrWK46LyCP+jOtzP9HTRqAeopUqE68ZZ3Fp05AhigkFfhpjMtmOdu2
	L7ah+8MJmwphlSu3YRG0TiLAoKt9xn4/XlA1JIRDmflAHZJnHKDTunawbZ0m1hjK
	4a8uEUdR/GVNqU4rKgT/YkbaCew0rG65rQc6e55CbY84WPsekYlbnCaP3/ddkK6U
	pG4KSvQm6Uss+H7C1jv8nAmpGL1weHdCk9GFxzU1rHQdGRx6oNcP7UqTyxeVKKuw
	agyZDbUU7VDLGi0KEKrurs2BQpTGnSNf38GL8SsOB7S3lcPg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqf1jxbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 09 Sep 2026 08:12:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9105be46009so47913026d6.1
        for <linux-firmware@kernel.org>; Wed, 09 Sep 2026 01:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788941572; x=1789546372; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j9Vog8lVbKT5BVSSC20ttjLtxMGAmXgap/JnOO3lNBE=;
        b=cS/kPhjrv/K4o7hr3xAaufAh6CDwXZwmX5EIycMGgQu/ewWdwFCb04hgnQNndazfOr
         EY9KB9YDX6/zcqKH9yWAEMwJxyn4ibc2pEwMkbQjpBGvo+HxfqLJv9rv4O3FKpBufX2v
         kue8RwVd5GjeHEN9DbRCTFXegd5DWFXAxUiR7PrxcFwdVUI/d7cMQ/X1M/ltlWAHwYPF
         6X0jHF+/AL5lRVW9URfYYfBftXa17Y1I2PhA/CbGoZkUOp4uLaFRbbcUi7L19RF3iBAo
         dac3pjjsbv+EhLvOKJW9yNO0I7hcbvxp9/9+htEUZojSZ2k7FCaTM7kpJO62sbFSlw/h
         wDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941572; x=1789546372;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j9Vog8lVbKT5BVSSC20ttjLtxMGAmXgap/JnOO3lNBE=;
        b=eIv6l9Amzcv2Rx8n3rcO/IAKda8eA1Sqf67IUVvPQqepuK4DjXVfwdMNMzzkqpIEq2
         7u1jD1f4XJApm0X+wO2hM26xVDGnAm6IfVkUrGgH8i86dSbmn029oV/EnQQ2Syz26nBy
         7M9LeBCSUJjrNO508nl14BJhFl9lTtwkui+nK3lR0VQbUbFadVUZuehBLm6WOWxaaE5w
         ikVP/LctcXHkO1ntX96tvO1WuktDpfTZMVqmJSV6MTuqvcX5uOacT9sJCpXWUE3+V0Q2
         fxiupA7Iw1IGl+nJlpA1qaBhW9jUKpj7dpCemlfdYWvFQsAGyYS7N5AM3bGeMNF85t5J
         0Pvw==
X-Gm-Message-State: AFuF++lnBXS7dTWGo6m4vvxWPpoJfaReduLh84TcjuEPp+Zy7TuML50r
	NRMF7B6FhusEhc2zMlHf65BmYnX+SqV1i+HIIHZAjRWavd5dvojADWM31Qoc9KARHgkj8rmot/m
	VtIbwSKvHpB3DrjLDHCAqMSPP/Zx8BdfEO53tKLMnsn6TrzkAtBGi5KroeSXg9bmaK+QBKOg=
X-Gm-Gg: AYBFou1+TYY7XYzPDIaoU9x/hesjJ2FScrms/tMh8VwtXAAOb7Fm0klpMn4vqYVxyIe
	Q7tNoia3WKTvsNsRHFRa+WEcoI8oOtb++tydmZIpivMfI6ogsOoiudq4stTqwze1tUh8/Lhw59r
	57jOKaiprW6ptjEZt43o/YdpwWlT2xNuexl45rCuJbIW0Eomo56pXId4liN7cAlCnjW27ddt6YY
	OkzjNXBouXTny+51kGFXBBUII5v8HTbliFe0na8KzLR/7I0ntwbMXDUhEAwd7zhE5nJ37+Gd7nh
	IFw6f1fTVE8hjE4rZ9CoIEeUPKztGmKN9P5NetnAnCcMAQRQ5Jd9xnUufhxA4Blp8Ux5DMrEVK9
	qid4PtRwnomY+BYVqiM1hPeq+NIhp
X-Received: by 2002:a05:6214:451c:b0:910:71a7:8aaf with SMTP id 6a1803df08f44-91071a78bebmr2916736d6.6.1788941571850;
        Wed, 09 Sep 2026 01:12:51 -0700 (PDT)
X-Received: by 2002:a05:6214:451c:b0:910:71a7:8aaf with SMTP id 6a1803df08f44-91071a78bebmr2916416d6.6.1788941571428;
        Wed, 09 Sep 2026 01:12:51 -0700 (PDT)
Received: from [10.239.96.184] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406afe48sm136994696d6.43.2026.09.09.01.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 01:12:51 -0700 (PDT)
Message-ID: <e2681e20-cfda-469a-94df-8f80f4cf56fc@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 16:12:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
Subject: Subject: [V2] QCA: Add Bluetooth firmware for WCN7750 on Maili
 platform
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com,
        Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5MSBTYWx0ZWRfX41DvwFEHM+Ez
 UvUn9npdq5WQIAS66zD+PgeyhPw9UGgYZd1vcxKtDGBVJqeXgRU0NTDPPwX9KcD7YOsJa//1zLC
 5CzQX1AH0I8jCUmBD7KlTd5UkIEw/yl2anqTtVhjfBrAjQdcxkYPqoffu/XOhLQZXzQqxI4OenB
 IIUwRzt+F5sOphDcrC2ZPj1gg4COKbQfs66YtPU63WeiPuENwPriozybNxZt9unmodcootpsTd5
 qfPqej3LKyUvSIcQcOFDBn0xVMblq6OkVDpTBqutGNrvAXboKlaK4YjNUYLaHTw5Whp6MWQdND3
 WAH1yVtCDt/oUmIdsFCgkCP3U+t8N7raQGnWoLNm8lwGRIwJQZ6NyykJAYNa2YHXkd1VrEbe7X3
 JQAnv1cpXq0iw2zFuX7gm6Xy8M9NQgVZMiOQjcEU4CMdsXPqQwICKf37bqqAdzz/JqOPMH/k6gv
 5FuKYuS29dSNgp2Ms5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5MSBTYWx0ZWRfX2pbbvoUxz05K
 7hTYVq3UIfKVb+W1TjuZRVlO2hJikCPtxG9qpSxxyk06jDjCf8aKIpo/lOllqnIe4vphulimioi
 HCE6DVK10aJJ/UB/JIs7fMKb5Cn/5ck=
X-Proofpoint-GUID: 7IbGjxQKADZ_1rWZvSreMAN0FPuW37VO
X-Authority-Analysis: v=2.4 cv=JY2Ma0KV c=1 sm=1 tr=0 ts=6aa11504 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=Sn8UIFDche7Y4TsDfucA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 7IbGjxQKADZ_1rWZvSreMAN0FPuW37VO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090091

Hi linux-firmware maintainers,

Here's a pull request for btfw. Please let me know if you have any problems.

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:                                                                            
                                                                                                                                                          
    Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)                                                                                       
                                                                                                                                                          
  are available in the Git repository at:                                                                                                                 
                                                                                                                                                          
    https://github.com/xiuzhuo-shang/qca_btfw.git main                                                                                                    
                                                                                                                                                          
  for you to fetch changes up to 240a1135182a9b23cbfbee4427bcfbef21cf8735:                                                                                                                                                                                               [0/1394]
                                                                                                                                                          
    QCA: Add Bluetooth firmware for WCN7750 on Maili platform (2026-09-07 22:43:53 +0800)                                                                 
                                                                                                                                                          
  ----------------------------------------------------------------                                                                                        
  Xiuzhuo Shang (1):                                                                                                                                      
        QCA: Add Bluetooth firmware for WCN7750 on Maili platform                                                                                         
                                                                                                                                                          
   WHENCE              |  13 +++++++++++++                                                                                                                
   qca/ornbcscal10.bin | Bin 0 -> 744 bytes                                                                                                               
   qca/ornbtfw10.tlv   | Bin 0 -> 224945 bytes                                                                                                            
   qca/ornnv10.bin     | Bin 0 -> 10837 bytes                                                                                                             
   4 files changed, 13 insertions(+)                                                                                                                      
   create mode 100644 qca/ornbcscal10.bin                                                                                                                 
   create mode 100644 qca/ornbtfw10.tlv                                                                                                                   
   create mode 100644 qca/ornnv10.bin                                                
