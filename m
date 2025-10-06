Return-Path: <SRS0=YqoM=4P=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C002CCA471
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Oct 2025 11:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E37A6C4CEF9; Mon,  6 Oct 2025 11:51:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 322D7C4CEF5
	for <linux-firmware@kernel.org>; Mon,  6 Oct 2025 11:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 322D7C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NwGbh011160
	for <linux-firmware@kernel.org>; Mon, 6 Oct 2025 11:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bNM3Fn/5R19FE0bb3OUp0X3C
	DxH7I2HoPlhyGW8GUIQ=; b=jmLf8SaY6DVhf1wx9Gjf/0Pb3+Lafs9bVpHcS8OR
	+xxcJhxO6hG3MWW2vA3+Ydlv0Fofowl7XJ/E2W5kxMbzGQihHvVSzzl1PnDdBMVv
	7Me6qSsfXCWbLYpvbspkX6A+zs6GwVjRV2iulrOgwpBLdZ4uNo3mXNkapOhly+iq
	hgymACw8cWd3ZdCWntvHSeQr7n9XPs8RpgunWM29BqDTR+01Wv6/f11BPLtdVMrL
	IOjTwn82zym2WX+jY7A6APls0BkHMIP3Ev3ML7GVVxyK++/+6TgKOdMTbzgahUQd
	c7QzcpascbNDzCzBcJTyy9eFl32vecHCkkpgp3JjyKIujw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6unq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 06 Oct 2025 11:51:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28e8112143fso6477735ad.2
        for <linux-firmware@kernel.org>; Mon, 06 Oct 2025 04:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759751474; x=1760356274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNM3Fn/5R19FE0bb3OUp0X3CDxH7I2HoPlhyGW8GUIQ=;
        b=gNQDFXvRYvP8GGiR+jOp0dVHGkXkmOCEnZvhJa9HeIhmbxo1RbbPjaU+IG+HAyyBxx
         s8Gv5U2B/BBKnxjwckLH7l0m9tLj6DEO1XX6kV8Rd2/c6GB3yNQE2Zz4Xx0GvYWwT4Yq
         2R624CgOEgpoVguR2bQFQ/xD5w3XCm3QuNz4SfRK3FYfGDg0B0Fpl3hZy3mxL7PHy5Tp
         yxdlXdhx5c6gnKZOWjIF1toCmfshoAg149mARzbl1D8ux+bEW4yebkch3aRZmgZqzbP5
         hqRPHBWBk0Q+uHtd/RkSpJYk8QH8bU2V7wFjJFFSPgqUmgBzDJGBGcyVIP86oU1hi4KE
         MpEw==
X-Gm-Message-State: AOJu0YwnGt6Fwj496jU6lfkS2EsU/YLSvPv4JDD+glX3Gf9muTC1kXQV
	vir4XkqJbKH5NwF7cQpyZYrnkFfGFAGwLmqgD0UOU5WxRIuwFOZji7xlY6Tmd4HTEPooz2lGAXM
	LyrRz/+igNxLorhGt++wKuy9e2fnBihiYBYrQxNZb/zaazqeNZ4jEbLvxtIHH0nrzYVGc53JuPg
	lP8UIlNM6qagHNC1u5KCvI5UWoEd2GPu6Kb4ac+C7iEEsCgA==
X-Gm-Gg: ASbGncuFtY27NYF8SZgpmTsGnGMYrcTnCY+Tw9Kekv0YY32zpklbT/5tqVwRsvi6d/S
	lxnYkwH+dRFwZe5OfrDfXMQJKbRuxDaCxhsGrO+xYsf4QipALqxdg0cZYo/Jq8l2UTtuD48PxA/
	SgERR6rQW1yoUHO2bnoXBovEBixkArPBP1KF2DLcAowHijDOy/y36m04DCiw==
X-Received: by 2002:a17:903:1b2b:b0:26c:9b12:2b6d with SMTP id d9443c01a7336-28e9a5f7328mr144226965ad.38.1759751474437;
        Mon, 06 Oct 2025 04:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPkoYz4XPvDQs82pqXb8MsVhuZfDBcm4AeSlrQcvRXYOye38zq73nvtsZTlB6U7d54KvS63lhfhryny8c0Ejw=
X-Received: by 2002:a17:903:1b2b:b0:26c:9b12:2b6d with SMTP id
 d9443c01a7336-28e9a5f7328mr144226465ad.38.1759751473689; Mon, 06 Oct 2025
 04:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAPiVHHi2dk5eX2vRqzX014q__WH=-YNghqv-kZgSfbzGvUgJHA@mail.gmail.com>
In-Reply-To: <CAPiVHHi2dk5eX2vRqzX014q__WH=-YNghqv-kZgSfbzGvUgJHA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 14:51:01 +0300
X-Gm-Features: AS18NWA0TOwkw0kxLBaGN0ShS1aDmmkmiAqcSQNZegidSkvfEarDiR-etXm-Cr0
Message-ID: <CAO9ioeWCfAFMZEwpC5U=Jh006TR38qhE9uzgTpWnq7YDfSOvHw@mail.gmail.com>
Subject: Re: [GIT PULL] qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
To: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hbandi@qti.qualcomm.com,
        mohamull@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e3ad33 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=Va1OMgYtlyjMN_oiB0gA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: jzAxRpuK1d--YcmMbncOpus1ioUcKDi5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfXypqTPtUe6FVU
 jEiAC9c509X5MwsejPUveCRIKr3i+4FtNa0okqzqitAFilNcm/xzb3rZDDXXU9cpl7ilDxNjPD7
 1XOj8lUUuO7efzLAhWKDmCH9/1FKXVeifYIgANs8mKcpEoMjbZkORfeA6wJtO11H4FMMR6gjMGc
 SUDw3TqTOhScCVM0WBqtPMQ00r9sQHbTeSirLSlbLw8wEH7xaFZOEMtiyBp1PzKwx4RC0GpA3nR
 u20jF05S2BdQ7gALP2T2hxcfCzvLw7vYhNOK8ZUGqZ8ruKDHiQ9RlGSzWjl1r6g1NPZuJ66/8B1
 OBjsw9bzqAHf8Y3T4mO4+geouG99c1d79OGFwrT5r2K4eFd6k5vj+zctmkEDK6HUgBcd3wKbl+/
 hc2u4fr33AfylcywRYhhBd4leLR2PA==
X-Proofpoint-ORIG-GUID: jzAxRpuK1d--YcmMbncOpus1ioUcKDi5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

On Mon, 6 Oct 2025 at 14:18, Janaki Ramaiah Thota
<janaki.thota@oss.qualcomm.com> wrote:
>
> Hi linux-firmware maintainers,
>
>  Here's a pull request for bluetooth firmware. Please let me know if
>  you have any problems.
>
> The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf543f59034:
>
>   Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:36:21 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/quicjathot/bt_msl_fw_1.1.3_00100.git HEAD

This commit changes the default NV dump, but leaves two board-specific
files untouched. Are they still compatible with the new firmware?

>
> for you to fetch changes up to 64b8572f8542709bb9331fd30da0165c4ecfdc24:
>
>   qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
> (2025-10-06 16:18:31 +0530)
>
> ----------------------------------------------------------------
> Janaki Ramaiah Thota (1):
>       qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
>
> Thanks,
> Janakiramaiah Thota



-- 
With best wishes
Dmitry
